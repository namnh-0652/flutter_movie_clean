import 'package:domain/interactor/output/output_observer.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/tv_series.dart';
import 'package:domain/usecase/get_latest_movies_use_case.dart';
import 'package:domain/usecase/get_trending_movies_use_case.dart';
import 'package:domain/usecase/get_latest_series_use_case.dart';
import 'package:flutter_movie_clean/pages/base/base_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(
    this._getLatestMoviesUseCase,
    this._getLatestSeriesUseCase,
    this._getTrendingMoviesUseCase,
  );

  final GetLatestMoviesUseCase _getLatestMoviesUseCase;
  final GetLatestSeriesUseCase _getLatestSeriesUseCase;
  final GetTrendingMoviesUseCase _getTrendingMoviesUseCase;

  AsyncValue<List<Movie>> get latestMovies => _latestMovies;
  AsyncValue<List<Movie>> _latestMovies = const AsyncValue.loading();

  AsyncValue<List<TvSeries>> get latestSeries => _latestSeries;
  AsyncValue<List<TvSeries>> _latestSeries = const AsyncValue.loading();

  AsyncValue<List<Movie>> get trendingMovies => _trendingMovies;
  AsyncValue<List<Movie>> _trendingMovies = const AsyncValue.loading();

  void getLatestMovies() async {
    await _getLatestMoviesUseCase.call(
      const GetLatestMoviesInput(),
      OutputObserver()
        ..onSubscribe(() {
          _latestMovies = const AsyncValue.loading();
        })
        ..onSuccess((movies) {
          _latestMovies = AsyncValue.data(movies);
        })
        ..onError((error) {
          _latestMovies = AsyncValue.error(error, StackTrace.empty);
        }),
    );
    notifyListeners();
  }

  void getLatestSeries() async {
    await _getLatestSeriesUseCase.call(
      const GetLatestSeriesInput(),
      OutputObserver()
        ..onSubscribe(() {
          _latestSeries = const AsyncValue.loading();
        })
        ..onSuccess((movies) {
          _latestSeries = AsyncValue.data(movies);
        })
        ..onError((error) {
          _latestSeries = AsyncValue.error(error, StackTrace.empty);
        }),
    );
    notifyListeners();
  }

  void getTrendingMovies() async {
    await _getTrendingMoviesUseCase.call(
      const GetTrendingMoviesInput(),
      OutputObserver()
        ..onSubscribe(() {
          _trendingMovies = const AsyncValue.loading();
        })
        ..onSuccess((movies) {
          _trendingMovies = AsyncValue.data(movies);
        })
        ..onError((error) {
          _trendingMovies = AsyncValue.error(error, StackTrace.empty);
        }),
    );
    notifyListeners();
  }
}
