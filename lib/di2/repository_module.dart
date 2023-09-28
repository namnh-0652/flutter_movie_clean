import 'package:dio/dio.dart';
import 'package:flutter_movie_clean/configs/env_configs.dart';
import 'package:flutter_movie_clean/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/auth_api.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/un_auth_api.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/movie_remote_data_source.dart';
import 'package:flutter_movie_clean/di2/service_locator.dart';
import 'package:flutter_movie_clean/domain/repository/movie_repository.dart';

import '../data/repository/source/remote/api/helper/dio_builder.dart';
import '../data/repository/source/remote/api/middleware/auth_interceptor.dart';

const String _authDioInstanceName = "authDio";
const String _unAuthDioInstanceName = "unAuthDio";

void setupRepositoryModule() {
  locator.registerLazySingleton(
    () => DioBuilder.createDio(options: BaseOptions(baseUrl: EnvConfigs.baseUrl)),
    instanceName: _unAuthDioInstanceName,
  );
  locator.registerLazySingleton(
    () {
      return DioBuilder.createDio(
        options: BaseOptions(baseUrl: EnvConfigs.baseUrl),
        interceptors: [
          locator<AuthInterceptor>(),
          locator<LogInterceptor>(),
        ],
      );
    },
    instanceName: _authDioInstanceName,
  );
  locator.registerLazySingleton(() => AuthInterceptor(locator()));
  locator.registerLazySingleton(() => LogInterceptor());
  locator.registerLazySingleton(
    () => AuthApi(locator.get(instanceName: _authDioInstanceName)),
  );
  locator.registerLazySingleton(
    () => UnAuthApi(locator.get(instanceName: _unAuthDioInstanceName)),
  );

  locator.registerLazySingleton(() => MovieRemoteDataSource(locator()));
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(locator(), locator(), locator(), locator()),
  );
}
