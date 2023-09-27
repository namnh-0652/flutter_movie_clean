import 'package:flutter_movie_clean/domain/model/paging_data.dart';
import 'package:flutter_movie_clean/domain/usecase/get_sorted_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_sorted_series_use_case.dart';
import 'package:flutter_movie_clean/presentation/model/enums/category_type.dart';
import 'package:flutter_movie_clean/presentation/model/enums/sort_type.dart';
import 'package:flutter_movie_clean/presentation/model/poster.dart';
import 'package:flutter_movie_clean/presentation/pages/base/base_view_model.dart';
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

  void fetchPostersByCategory(int page) {
    if (_isMoviesCategorySelected()) {
      getSortedMovies(selectedSortType.value, page);
    } else {
      getSortedSeries(selectedSortType.value, page);
    }
  }

  void getSortedMovies(String sortBy, int page) async {
    launchUseCase(
      useCase: _getSortedMoviesUseCase,
      input: GetSortedMoviesInput(sortBy: sortBy, page: page),
      onSubscribe: () {
        _postersPagingData = const AsyncValue.loading();
      },
      onSuccess: (pagingData) {
        final posterPagingData = PagingData(
          pagingData.page,
          pagingData.totalPage,
          pagingData.data.map((e) => Poster.fromMovie(e)).toList(),
        );
        _postersPagingData = AsyncValue.data(posterPagingData);
      },
      onError: (error) {
        _postersPagingData = AsyncValue.error(error, StackTrace.empty);
      },
    );
  }

  void getSortedSeries(String sortBy, int page) async {
    launchUseCase(
      useCase: _getSortedSeriesUseCase,
      input: GetSortedSeriesInput(sortByValue: sortBy, page: page),
      onSubscribe: () {
        _postersPagingData = const AsyncValue.loading();
      },
      onSuccess: (pagingData) {
        final posterPagingData = PagingData(
          pagingData.page,
          pagingData.totalPage,
          pagingData.data.map((e) => Poster.fromTvSeries(e)).toList(),
        );
        _postersPagingData = AsyncValue.data(posterPagingData);
      },
      onError: (error) {
        _postersPagingData = AsyncValue.error(error, StackTrace.empty);
      },
    );
  }

  bool isSameCategory(CategoryType categoryType) {
    return selectedCategoryType == categoryType;
  }

  bool isSameSortType(SortType sortType) {
    return selectedSortType == sortType;
  }

  bool _isMoviesCategorySelected() {
    return selectedCategoryType == CategoryType.movies;
  }
}
