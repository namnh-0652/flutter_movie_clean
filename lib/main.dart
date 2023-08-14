import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie_clean/configs/env_configs.dart';
import 'package:flutter_movie_clean/route/app_router.dart';
import 'package:flutter_movie_clean/route/app_shell_router.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routerConfig: appRouterWithShellRoute,
    );
  }
}
