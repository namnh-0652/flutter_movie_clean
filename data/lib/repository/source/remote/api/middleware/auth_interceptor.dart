import 'package:data/repository/source/local/preference/shared_pref_key.dart';
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
    const tempToken = "place_temp_token_here";
    final accessToken = sharedPreferences.getString(SharedPrefKey.accessToken);
    if (tempToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer ${accessToken ?? tempToken}";
    }
    handler.next(options);
  }
}
