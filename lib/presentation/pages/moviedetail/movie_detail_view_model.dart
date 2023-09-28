import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';
import 'package:flutter_movie_clean/domain/model/casts.dart';
import 'package:flutter_movie_clean/domain/usecase/get_casts_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_movie_detail_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_similar_movies_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/base/loading_state.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/detail_state.dart';
import 'package:flutter_movie_clean/shared/constant/constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieDetailViewModel extends StateNotifier<DetailState> {
  MovieDetailViewModel(this.ref) : super(const DetailState());
  final Ref ref;

  void getMovieDetail(int movieId) {
    ref.read(getMovieDetailUseCaseProvider).invoke(
          GetMovieDetailInput(movieId: movieId),
          OutputObserver(
            onLoading: () =>
                ref.read(loadingStateProvider.notifier).addProcess(),
            onSuccess: (data) => state = state.copyWith(movie: data),
            onError: (e) => state = state.copyWith(error: e),
            onFinish: () =>
                ref.read(loadingStateProvider.notifier).removeProcess(),
          ),
        );
  }

  void getSimilarMovies(int movieId) {
    ref.read(getSimilarUseCaseProvider).invoke(
          GetSimilarMoviesInput(movieId: movieId),
          OutputObserver(
            onLoading: () =>
                ref.read(loadingStateProvider.notifier).addProcess(),
            onSuccess: (data) => state = state.copyWith(
              similarMovies: data
                  .where(
                    (movie) => (movie.posterPath != null &&
                        (movie.releaseDate != null ||
                            movie.releaseDate?.isNotEmpty == true)),
                  )
                  .toList(),
            ),
            onError: (e) => state = state.copyWith(error: e),
            onFinish: () =>
                ref.read(loadingStateProvider.notifier).removeProcess(),
          ),
        );
  }

  void getCasts(int movieId) {
    ref.read(getCastsUseCaseProvider).invoke(
          GetCastsInput(movieId: movieId),
          OutputObserver(
            onLoading: () =>
                ref.read(loadingStateProvider.notifier).addProcess(),
            onSuccess: (data) {
              final casts = Casts(
                id: data.id,
                cast: data.cast
                    ?.where(
                      (cast) => (cast.knownForDepartment == acting &&
                          cast.profilePath != null &&
                          (cast.character != null ||
                              cast.character?.isNotEmpty == true)),
                    )
                    .toList(),
              );
              state = state.copyWith(casts: casts);
            },
            onError: (e) => state = state.copyWith(error: e),
            onFinish: () =>
                ref.read(loadingStateProvider.notifier).removeProcess(),
          ),
        );
  }
}

final movieDetailViewModelProvider = StateNotifierProvider.autoDispose
    .family<MovieDetailViewModel, DetailState, int>((ref, movieId) {
  return MovieDetailViewModel(ref);
});
