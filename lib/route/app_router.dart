import 'package:flutter_movie_clean/pages/main/main_page.dart';
import 'package:flutter_movie_clean/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/pages/welcome_screen/welcome_screen.dart';
import 'package:flutter_movie_clean/shared/extensions/string_ext.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: WelcomeScreen.routeLocation,
  routes: [
    GoRoute(
      path: MainPage.routeLocation,
      name: MainPage.routeName,
      builder: (context, state) => const MainPage(),
      routes: [
        GoRoute(
          path: MovieDetailPage.routeLocation.toSubRouteLocation(),
          name: MovieDetailPage.routeName,
          builder: (context, state) => const MovieDetailPage(),
        ),
      ],
    ),
    GoRoute(
      path: WelcomeScreen.routeLocation,
      name: WelcomeScreen.routeName,
      builder: (context, state) => const WelcomeScreen(),
    ),
  ],
);
