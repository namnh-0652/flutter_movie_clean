import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie_clean/configs/env_configs.dart';
import 'package:flutter_movie_clean/data/repository/source/local/db/isar_helper.dart';
import 'package:flutter_movie_clean/di/app_provider.dart';
import 'package:flutter_movie_clean/shared/themes/text_themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvConfigs();
  final sharedPrefs = await SharedPreferences.getInstance();
  final isar = await IsarHelper.getInstance();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
  );
  runApp(ProviderScope(
    overrides: [
      sharedPrefsProvider.overrideWithValue(sharedPrefs),
      isarProvider.overrideWithValue(isar)
    ],
    child: const MyApp(),
  ));
}

Future<void> loadEnvConfigs() async {
  const environment = String.fromEnvironment("FLAVOR", defaultValue: "develop");
  await EnvConfigs.load(environment.toLowerCase());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(textTheme: interTextTheme),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          routeInformationParser: appRouter.routeInformationParser,
          routeInformationProvider: appRouter.routeInformationProvider,
          routerDelegate: appRouter.routerDelegate,
        );
      },
    );
  }
}
