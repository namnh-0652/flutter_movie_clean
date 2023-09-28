import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_series_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_trending_movies_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/base/loading_state.dart';
import 'package:flutter_movie_clean/presentation/pages/home/home_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final Ref ref;

  HomeViewModel(this.ref) : super(const HomeState());

  void getLatestMovies() {
    ref.read(getLatestMoviesUseCaseProvider).invoke(
          const GetLatestMoviesInput(),
          OutputObserver(
            onLoading: () =>
                ref.read(loadingStateProvider.notifier).addProcess(),
            onSuccess: (data) => state = state.copyWith(latestMovies: data),
            onError: (e) => state = state.copyWith(error: e),
            onFinish: () =>
                ref.read(loadingStateProvider.notifier).removeProcess(),
          ),
        );
  }

  void getLatestSeries() {
    ref.read(getLatestSeriesUseCaseProvider).invoke(
          const GetLatestSeriesInput(),
          OutputObserver(
            onLoading: () =>
                ref.read(loadingStateProvider.notifier).addProcess(),
            onSuccess: (data) => state = state.copyWith(tvSeries: data),
            onError: (e) => state = state.copyWith(error: e),
            onFinish: () =>
                ref.read(loadingStateProvider.notifier).removeProcess(),
          ),
        );
  }

  void getTrendingMovies() {
    ref.read(getTrendingMoviesUseCaseProvider).invoke(
          const GetTrendingMoviesInput(),
          OutputObserver(
            onLoading: () =>
                ref.read(loadingStateProvider.notifier).addProcess(),
            onSuccess: (data) => state = state.copyWith(trendingMovies: data),
            onError: (e) => state = state.copyWith(error: e),
            onFinish: () =>
                ref.read(loadingStateProvider.notifier).removeProcess(),
          ),
        );
  }
}

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>((ref) {
  return HomeViewModel(ref);
});
