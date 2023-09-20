import 'package:flutter_movie_clean/data/repository/source/remote/api/auth_api.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/helper/dio_builder.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/middleware/auth_interceptor.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/middleware/pretty_log_interceptor.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/un_auth_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_clean/di/app_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// UnAuthApi providers

final unAuthDioProvider = Provider<Dio>((ref) {
  final envConfigs = ref.watch(envConfigsProvider);
  return DioBuilder.createDio(
    options: BaseOptions(baseUrl: envConfigs.baseUrl),
  );
});

final unAuthApiProvider = Provider<UnAuthApi>((ref) {
  return UnAuthApi(ref.watch(unAuthDioProvider));
});

/// AuthApi providers

final authDioProvider = Provider<Dio>((ref) {
  final envConfigs = ref.watch(envConfigsProvider);
  return DioBuilder.createDio(
    options: BaseOptions(baseUrl: envConfigs.baseUrl),
    interceptors: [
      ref.watch(authInterceptorProvider),
      ref.watch(logInterceptorProvider),
    ],
  );
});

final authApiProvider = Provider<AuthApi>((ref) {
  return AuthApi(ref.watch(authDioProvider));
});

/// Interceptor providers

final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  return AuthInterceptor(ref.watch(sharedPrefsProvider));
});

final logInterceptorProvider = Provider<PrettyLogInterceptor>((ref) {
  return PrettyLogInterceptor();
});
