import 'package:data/repository/movie_repository_impl.dart';
import 'package:data/repository/source/remote/movie_remote_data_source.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:flutter_movie_clean/di/mapper_provider.dart';
import 'package:flutter_movie_clean/di/network_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>(
  (ref) => MovieRemoteDataSource(ref.watch(authApiProvider)),
);

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepositoryImpl(
    ref.watch(movieRemoteDataSourceProvider),
    ref.watch(movieMapperProvider),
    ref.watch(tvSeriesMapperProvider),
  );
});
