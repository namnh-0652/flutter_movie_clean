import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie_clean/configs/env_configs.dart';
import 'package:flutter_movie_clean/shared/themes/text_themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_movie_clean/route/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvConfigs();
  runApp(const MyApp());
}

Future<void> loadEnvConfigs() async {
  const environment = String.fromEnvironment("FLAVOR", defaultValue: "develop");
  await EnvConfigs.load(environment.toLowerCase());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: interTextTheme,
            ),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            routerConfig: appRouter,
          );
        });
  }
}
