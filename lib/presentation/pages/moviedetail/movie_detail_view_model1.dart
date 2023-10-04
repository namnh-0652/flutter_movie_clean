import 'dart:async';

import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';
import 'package:flutter_movie_clean/domain/model/casts.dart';
import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter_movie_clean/domain/usecase/get_casts_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_movie_detail_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_similar_movies_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/detail_state.dart';
import 'package:flutter_movie_clean/shared/constant/constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_detail_view_model1.g.dart';

class MovieDetailViewModel1
    extends AutoDisposeFamilyAsyncNotifier<DetailState, int> {
  @override
  FutureOr<DetailState> build(int arg) async {
    getMovieDetail(arg);
    getSimilarMovies(arg);
    getCasts(arg);
    return const DetailState();
  }

  DetailState movieState(Movie data) =>
      state.valueOrNull?.copyWith(movie: data) ?? DetailState(movie: data);
  DetailState castsState(Casts data) =>
      state.valueOrNull?.copyWith(casts: data) ?? DetailState(casts: data);
  DetailState similarMoviesState(List<Movie> data) =>
      state.valueOrNull?.copyWith(similarMovies: data) ??
      DetailState(similarMovies: data);

  void getMovieDetail(int movieId) {
    ref.read(getMovieDetailUseCaseProvider).invoke(
          GetMovieDetailInput(movieId: movieId),
          OutputObserver(
            onSuccess: (data) => state = AsyncValue.data(movieState(data)),
            onError: (e) => state = AsyncValue.error(e, StackTrace.current),
          ),
        );
  }

  void getSimilarMovies(int movieId) {
    ref.read(getSimilarUseCaseProvider).invoke(
          GetSimilarMoviesInput(movieId: movieId),
          OutputObserver(
            onSuccess: (data) {
              final similarMovies = data
                  .where((movie) =>
                      movie.posterPath != null &&
                      (movie.releaseDate != null ||
                          movie.releaseDate?.isNotEmpty == true))
                  .toList();
              state = AsyncValue.data(similarMoviesState(similarMovies));
            },
            onError: (e) => state = AsyncValue.error(e, StackTrace.current),
          ),
        );
  }

  void getCasts(int movieId) {
    ref.read(getCastsUseCaseProvider).invoke(
          GetCastsInput(movieId: movieId),
          OutputObserver(
            onSuccess: (data) {
              final casts = Casts(
                  id: data.id,
                  cast: data.cast
                      ?.where((cast) => (cast.knownForDepartment == acting &&
                          cast.profilePath != null &&
                          (cast.character != null ||
                              cast.character?.isNotEmpty == true)))
                      .toList());
              state = AsyncValue.data(castsState(casts));
            },
            onError: (e) => state = AsyncValue.error(e, StackTrace.current),
          ),
        );
  }
}

final movieDetailViewModel1Provider = AsyncNotifierProvider.family
    .autoDispose<MovieDetailViewModel1, DetailState?, int>(
        MovieDetailViewModel1.new);

@riverpod
Future<Movie> movieDetail(MovieDetailRef ref, int movieId) async {
  return ref
      .watch(getMovieDetailUseCaseProvider)
      .buildUseCase(GetMovieDetailInput(movieId: movieId));
}

@riverpod
Future<List<Movie>> similarMovies(SimilarMoviesRef ref, int movieId) async {
  return ref
      .watch(getSimilarUseCaseProvider)
      .buildUseCase(GetSimilarMoviesInput(movieId: movieId));
}

@riverpod
Future<Casts> movieCasts(MovieCastsRef ref, int movieId) async {
  return ref
      .watch(getCastsUseCaseProvider)
      .buildUseCase(GetCastsInput(movieId: movieId));
}

@riverpod
Future<bool> screenLoading(ScreenLoadingRef ref, int movieId) async {
  return ref.watch(
          movieDetailProvider(movieId).select((value) => value.isLoading)) ||
      ref.watch(
          similarMoviesProvider(movieId).select((value) => value.isLoading)) ||
      ref.watch(movieCastsProvider(movieId).select((value) => value.isLoading));
}
// final mvProvider = FutureProvider.family<Movie, int>((ref, movieId) {
//   return ref.watch(getMovieDetailUseCaseProvider).buildUseCase(GetMovieDetailInput(movieId: movieId));
// });
// final svProvider = FutureProvider.family<List<Movie>, int>((ref, movieId) {
//   return ref.watch(getSimilarUseCaseProvider).buildUseCase(GetSimilarMoviesInput(movieId: movieId));
// });
// final cProvider = FutureProvider.family<Casts, int>((ref, movieId) {
//   return ref.watch(getCastsUseCaseProvider).buildUseCase(GetCastsInput(movieId: movieId));
// });

// final screenLoadingProvider = FutureProvider.autoDispose.family<bool, int>((ref, movieId) {
//   return ref.watch(mvProvider(movieId)).isLoading ||
//       ref.watch(svProvider(movieId)).isLoading ||
//       ref.watch(cProvider(movieId)).isLoading;
// });
