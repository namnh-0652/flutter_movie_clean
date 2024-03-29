import 'package:flutter_movie_clean/domain/usecase/get_latest_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_casts_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_series_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_sorted_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_sorted_series_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_trending_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_similar_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_movie_detail_use_case.dart';
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

final getSortedMoviesUseCaseProvider = Provider<GetSortedMoviesUseCase>(
  (ref) => GetSortedMoviesUseCase(ref.watch(movieRepositoryProvider)),
);

final getSortedSeriesUseCaseProvider = Provider<GetSortedSeriesUseCase>(
  (ref) => GetSortedSeriesUseCase(ref.watch(movieRepositoryProvider)),
);

final getMovieDetailUseCaseProvider = Provider<GetMovieDetailUseCase>(
  (ref) => GetMovieDetailUseCase(ref.watch(movieRepositoryProvider)),
);

final getSimilarUseCaseProvider = Provider<GetSimilarMoviesUseCase>(
  (ref) => GetSimilarMoviesUseCase(ref.watch(movieRepositoryProvider)),
);

final getCastsUseCaseProvider = Provider<GetCastsUseCase>(
  (ref) => GetCastsUseCase(ref.watch(movieRepositoryProvider)),
);
