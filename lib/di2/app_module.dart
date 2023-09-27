import 'package:flutter_movie_clean/di2/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setupAppModule() async {
  await _setupSharedPreferences();
}

Future<void> _setupSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
}
