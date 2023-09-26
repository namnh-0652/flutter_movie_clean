import 'package:flutter_movie_clean/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_clean/data/repository/source/local/user_local_data_source.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/movie_remote_data_source.dart';
import 'package:flutter_movie_clean/data/repository/source/user_repository_impl.dart';
import 'package:flutter_movie_clean/di/app_provider.dart';
import 'package:flutter_movie_clean/domain/repository/movie_repository.dart';
import 'package:flutter_movie_clean/di/mapper_provider.dart';
import 'package:flutter_movie_clean/di/network_provider.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>(
  (ref) => MovieRemoteDataSource(ref.watch(authApiProvider)),
);

final userLocalDataSourceProvider = Provider<UserLocalDataSource>(
  (ref) => UserLocalDataSource(
    isar: ref.read(isarProvider),
    sharedPreferences: ref.watch(sharedPrefsProvider),
  ),
);

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepositoryImpl(
    ref.watch(movieRemoteDataSourceProvider),
    ref.watch(movieMapperProvider),
    ref.watch(tvSeriesMapperProvider),
    ref.watch(castsMapperProvider),
  );
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    profileMapper: ref.watch(profileMapperProvider),
    accountMapper: ref.watch(accountMapperProvider),
    userLocalDataSource: ref.watch(userLocalDataSourceProvider),
  );
});
