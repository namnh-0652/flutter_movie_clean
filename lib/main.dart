import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_clean/profile_page/profile_page_screen.dart';
import 'package:flutter_movie_clean/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'suport/constants/device_constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  const supportedLocales = [Locale('en')];
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            EasyLocalization(
              supportedLocales: supportedLocales,
              path: 'assets/translations',
              fallbackLocale: supportedLocales[0],
              useOnlyLangCode: true,
              useFallbackTranslations: true,
              saveLocale: true,
              child: const MyApp(),
            ),
          ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final darkTheme = AppTheme.dark();
    final lightTheme = AppTheme.light();

    return ScreenUtilInit(
        designSize: Size(DeviceConstants.designScreenSize.width,
            DeviceConstants.designScreenSize.height),
        builder: (context, child) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const ProfilePage(),
          );
        });
  }
}