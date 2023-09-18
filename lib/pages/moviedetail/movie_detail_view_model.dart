import 'package:domain/interactor/output/output_observer.dart';
import 'package:domain/model/casts.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/usecase/get_casts_use_case.dart';
import 'package:domain/usecase/get_movie_detail_use_case.dart';
import 'package:domain/usecase/get_similar_movies_use_case.dart';
import 'package:flutter_movie_clean/pages/base/base_view_model.dart';
import 'package:flutter_movie_clean/shared/constant/constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieDetailViewModel extends BaseViewModel {
  MovieDetailViewModel(this._getMovieDetailUseCase, this._getCastsUseCase,
      this._getSimilarMoviesUseCase);

  final GetMovieDetailUseCase _getMovieDetailUseCase;
  final GetCastsUseCase _getCastsUseCase;
  final GetSimilarMoviesUseCase _getSimilarMoviesUseCase;

  AsyncValue<Movie> get movie => _movie;
  AsyncValue<Movie> _movie = const AsyncValue.loading();

  AsyncValue<Casts> get casts => _casts;
  AsyncValue<Casts> _casts = const AsyncValue.loading();

  AsyncValue<List<Movie>> get similarMovies => _similarMovies;
  AsyncValue<List<Movie>> _similarMovies = const AsyncValue.loading();

  void getMovieDetail(int movieId) async {
    await _getMovieDetailUseCase.call(
        GetMovieDetailInput(movieId: movieId),
        OutputObserver()
          ..onSubscribe(() {
            _movie = const AsyncValue.loading();
          })
          ..onSuccess((movie) {
            _movie = AsyncValue.data(movie);
          })
          ..onError((error) {
            _movie = AsyncValue.error(error, StackTrace.empty);
          }));
    notifyListeners();
  }

  void getSimilarMovies(int movieId) async {
    await _getSimilarMoviesUseCase.call(
        GetSimilarMoviesInput(movieId: movieId),
        OutputObserver()
          ..onSubscribe(() {
            _similarMovies = const AsyncValue.loading();
          })
          ..onSuccess((similarMovies) {
            _similarMovies = AsyncValue.data(similarMovies
                .where((element) => (element.posterPath != null &&
                    (element.releaseDate != null ||
                        element.releaseDate?.isNotEmpty == true)))
                .toList());
          })
          ..onError((error) {
            _similarMovies = AsyncValue.error(error, StackTrace.empty);
          }));
    notifyListeners();
  }

  void getCasts(int movieId) async {
    await _getCastsUseCase.call(
      GetCastsInput(movieId: movieId),
      OutputObserver()
        ..onSubscribe(() {
          _casts = const AsyncValue.loading();
        })
        ..onSuccess((casts) {
          var castsData = Casts(
              id: casts.id,
              cast: casts.cast
                  ?.where((element) => (element.knownForDepartment == acting &&
                      element.profilePath != null &&
                      (element.character != null ||
                          element.character?.isNotEmpty == true)))
                  .toList());
          _casts = AsyncValue.data(castsData);
        })
        ..onError((error) {
          _casts = AsyncValue.error(error, StackTrace.empty);
        }),
    );
    notifyListeners();
  }
}
