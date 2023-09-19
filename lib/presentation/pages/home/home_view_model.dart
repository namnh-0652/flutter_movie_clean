import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter_movie_clean/domain/model/tv_series.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_series_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_trending_movies_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/base/base_view_model.dart';
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

  void getLatestMovies() {
    launchUseCase(
      useCase: _getLatestMoviesUseCase,
      input: const GetLatestMoviesInput(),
      onSubscribe: () {
        _latestMovies = const AsyncValue.loading();
      },
      onSuccess: (data) {
        _latestMovies = AsyncValue.data(data);
      },
      onError: (error) {
        _latestMovies = AsyncValue.error(error, StackTrace.empty);
      },
    );
  }

  void getLatestSeries() {
    launchUseCase(
      useCase: _getLatestSeriesUseCase,
      input: const GetLatestSeriesInput(),
      onSubscribe: () {
        _latestSeries = const AsyncValue.loading();
      },
      onSuccess: (data) {
        _latestSeries = AsyncValue.data(data);
      },
      onError: (error) {
        _latestSeries = AsyncValue.error(error, StackTrace.empty);
      },
    );
  }

  void getTrendingMovies() {
    launchUseCase(
      useCase: _getTrendingMoviesUseCase,
      input: const GetTrendingMoviesInput(),
      onSubscribe: () {
        _trendingMovies = const AsyncValue.loading();
      },
      onSuccess: (data) {
        _trendingMovies = AsyncValue.data(data);
      },
      onError: (error) {
        _trendingMovies = AsyncValue.error(error, StackTrace.empty);
      },
    );
  }
}
