import 'package:domain/usecase/get_latest_movies_use_case.dart';
import 'package:domain/usecase/get_latest_series_use_case.dart';
import 'package:domain/usecase/get_trending_movies_use_case.dart';
import 'package:flutter_movie_clean/di/repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getLatestMoviesUseCaseProvider = Provider<GetLatestMoviesUseCase>(
  (ref) => GetLatestMoviesUseCase(ref.watch(movieRepositoryProvider)),
);

final getLatestSeriesUseCaseProvider = Provider<GetLatestSeriesUseCase>(
  (ref) => GetLatestSeriesUseCase(ref.watch(movieRepositoryProvider)),
);

final getTrendingMoviesUseCaseProvider = Provider<GetTrendingMoviesUseCase>(
  (ref) => GetTrendingMoviesUseCase(ref.watch(movieRepositoryProvider)),
);
