import 'package:flutter_movie_clean/configs/env_configs_provider.dart';
import 'package:flutter_movie_clean/configs/env_configs_proivder_impl.dart';
import 'package:flutter_movie_clean/presentation/route/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

final envConfigsProvider = Provider<EnvConfigsProvider>((ref) {
  return EnvConfigsProviderImpl();
});

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw Exception('Provider was not initialized');
});

final appRouterProvider = Provider<GoRouter>((ref) {
  return appRouter(ref);
});

final isarProvider = Provider<Isar>((ref) {
  throw Exception('Provider was not initialized');
});
