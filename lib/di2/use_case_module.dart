import 'package:flutter_movie_clean/di2/service_locator.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_series_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_trending_movies_use_case.dart';

void setupUseCaseModule() {
  locator.registerFactory(() => GetLatestMoviesUseCase(locator()));
  locator.registerFactory(() => GetLatestSeriesUseCase(locator()));
  locator.registerFactory(() => GetTrendingMoviesUseCase(locator()));
}
