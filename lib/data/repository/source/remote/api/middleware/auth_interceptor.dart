import 'package:flutter_movie_clean/data/repository/source/local/preference/shared_pref_key.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  const AuthInterceptor(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  // TODO Update logic later
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    const tempToken =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MjdiNWFhOGE0NmFmMGE5OGUyYjM5OTIxMThmNDYzYiIsInN1YiI6IjVmOWZiZTJjZjA0ZDAxMDAzN2E0ZDc5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.m-Dda75kQLr1zEk-xDKJpRLAi1G0bXVTq8sMt1LE02c";
    final accessToken = sharedPreferences.getString(SharedPrefKey.accessToken);
    if (tempToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer ${accessToken ?? tempToken}";
    }
    handler.next(options);
  }
}
