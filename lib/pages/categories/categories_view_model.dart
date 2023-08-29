import 'package:domain/interactor/output/output_observer.dart';
import 'package:domain/model/paging_data.dart';
import 'package:domain/usecase/get_sorted_movies_use_case.dart';
import 'package:domain/usecase/get_sorted_series_use_case.dart';
import 'package:flutter_movie_clean/model/enums/category_type.dart';
import 'package:flutter_movie_clean/model/enums/sort_type.dart';
import 'package:flutter_movie_clean/model/poster.dart';
import 'package:flutter_movie_clean/pages/base/base_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoriesViewModel extends BaseViewModel {
  CategoriesViewModel(
    this._getSortedMoviesUseCase,
    this._getSortedSeriesUseCase,
  );

  final GetSortedMoviesUseCase _getSortedMoviesUseCase;
  final GetSortedSeriesUseCase _getSortedSeriesUseCase;

  AsyncValue<PagingData<Poster>> get postersPagingData => _postersPagingData;
  AsyncValue<PagingData<Poster>> _postersPagingData =
      const AsyncValue.loading();

  CategoryType selectedCategoryType = CategoryType.movies;
  SortType selectedSortType = SortType.newest;

  void getSortedMovies(String sortBy, int page) async {
    await _getSortedMoviesUseCase.call(
      GetSortedMoviesInput(sortByValue: sortBy, page: page),
      OutputObserver()
        ..onSubscribe(() {
          _postersPagingData = const AsyncValue.loading();
          notifyListeners();
        })
        ..onSuccess((pagingData) {
          final posterPagingData = PagingData(
            pagingData.page,
            pagingData.totalPage,
            pagingData.data.map((e) => Poster.fromMovie(e)).toList(),
          );
          _postersPagingData = AsyncValue.data(posterPagingData);
          notifyListeners();
        })
        ..onError((error) {
          _postersPagingData = AsyncValue.error(error, StackTrace.empty);
          notifyListeners();
        }),
    );
  }

  void getSortedSeries(String sortBy, int page) async {
    await _getSortedSeriesUseCase.call(
      GetSortedSeriesInput(sortByValue: sortBy, page: page),
      OutputObserver()
        ..onSubscribe(() {
          _postersPagingData = const AsyncValue.loading();
          notifyListeners();
        })
        ..onSuccess((pagingData) {
          final posterPagingData = PagingData(
            pagingData.page,
            pagingData.totalPage,
            pagingData.data.map((e) => Poster.fromTvSeries(e)).toList(),
          );
          _postersPagingData = AsyncValue.data(posterPagingData);
          notifyListeners();
        })
        ..onError((error) {
          _postersPagingData = AsyncValue.error(error, StackTrace.empty);
          notifyListeners();
        }),
    );
  }

  bool isSameCategory(CategoryType categoryType) {
    return selectedCategoryType == categoryType;
  }

  bool isSameSortType(SortType sortType) {
    return selectedSortType == sortType;
  }

  bool isMoviesCategorySelected() {
    return selectedCategoryType == CategoryType.movies;
  }
}
