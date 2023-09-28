import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';
import 'package:flutter_movie_clean/domain/model/paging_data.dart';
import 'package:flutter_movie_clean/domain/usecase/get_sorted_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_sorted_series_use_case.dart';
import 'package:flutter_movie_clean/presentation/model/enums/category_type.dart';
import 'package:flutter_movie_clean/presentation/model/enums/sort_type.dart';
import 'package:flutter_movie_clean/presentation/model/poster.dart';
import 'package:flutter_movie_clean/presentation/pages/base/loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoriesViewModel
    extends StateNotifier<AsyncValue<PagingData<Poster>>> {
  CategoriesViewModel(
    this.ref,
  ) : super(const AsyncValue.loading()) {
    _getSortedMoviesUseCase = ref.watch(getSortedMoviesUseCaseProvider);
    _getSortedSeriesUseCase = ref.watch(getSortedSeriesUseCaseProvider);
  }

  late GetSortedMoviesUseCase _getSortedMoviesUseCase;
  late GetSortedSeriesUseCase _getSortedSeriesUseCase;
  final Ref ref;

  CategoryType selectedCategoryType = CategoryType.movies;
  SortType selectedSortType = SortType.newest;

  void fetchPostersByCategory(int page) {
    if (_isMoviesCategorySelected()) {
      getSortedMovies(selectedSortType.value, page);
    } else {
      getSortedSeries(selectedSortType.value, page);
    }
  }

  void getSortedMovies(String sortBy, int page) {
    _getSortedMoviesUseCase.invoke(
      GetSortedMoviesInput(sortBy: sortBy, page: page),
      OutputObserver(
        onLoading: () => ref.read(loadingStateProvider.notifier).addProcess(),
        onFinish: () => ref.read(loadingStateProvider.notifier).removeProcess(),
        onSuccess: (data) => state = AsyncValue.data(PagingData(
            data.page,
            data.totalPage,
            data.data.map((e) => Poster.fromMovie(e)).toList())),
        onError: (e) => state = AsyncValue.error(e, StackTrace.current),
      ),
    );
  }

  void getSortedSeries(String sortBy, int page) async {
    _getSortedSeriesUseCase.invoke(
      GetSortedSeriesInput(sortByValue: sortBy, page: page),
      OutputObserver(
        onLoading: () => ref.read(loadingStateProvider.notifier).addProcess(),
        onFinish: () => ref.read(loadingStateProvider.notifier).removeProcess(),
        onSuccess: (data) => state = AsyncValue.data(PagingData(
            data.page,
            data.totalPage,
            data.data.map((e) => Poster.fromTvSeries(e)).toList())),
        onError: (e) => state = AsyncValue.error(e, StackTrace.current),
      ),
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

final categoriesViewModelProvider = StateNotifierProvider.autoDispose<
    CategoriesViewModel, AsyncValue<PagingData<Poster>>>((ref) {
  return CategoriesViewModel(ref);
});
