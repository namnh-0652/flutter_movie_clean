import 'package:domain/interactor/output/output_observer.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/usecase/get_now_playing_movies_use_case.dart';
import 'package:flutter_movie_clean/pages/base/base_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(this._getNowPlayingMoviesUseCase);

  final GetNowPlayingMoviesUseCase _getNowPlayingMoviesUseCase;

  AsyncValue<List<Movie>> _nowPlayingMovies = const AsyncValue.loading();
  AsyncValue<List<Movie>> get nowPlayingMovies => _nowPlayingMovies;

  void getLatestMovies() async {
    await _getNowPlayingMoviesUseCase.call(
      const GetNowPlayingMoviesInput(),
      OutputObserver()
        ..onSubscribe(() {
          _nowPlayingMovies = const AsyncValue.loading();
        })
        ..onSuccess((movies) {
          _nowPlayingMovies = AsyncValue.data(movies);
        })
        ..onError((error) {
          _nowPlayingMovies = AsyncValue.error(error, StackTrace.empty);
        }),
    );
    notifyListeners();
  }
}
