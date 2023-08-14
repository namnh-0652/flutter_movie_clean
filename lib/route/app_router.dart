import 'package:flutter_movie_clean/pages/main/main_page.dart';
import 'package:flutter_movie_clean/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/route/routes.dart';
import 'package:go_router/go_router.dart';

import '../pages/moviedetail/movie_detail_page2.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: MainPage.routeLocation,
      builder: (context, state) => const MainPage(),
      routes: [
        GoRoute(
          path: MovieDetailPage.routeLocation.toChildRouteLocation(),
          name: MovieDetailPage.routeName,
          builder: (context, state) {
            return MovieDetailPage();
          },
          routes: [
            GoRoute(
              path: MovieDetailPage2.routeLocation.toChildRouteLocation(),
              name: MovieDetailPage2.routeName,
              builder: (context, state) => const MovieDetailPage2(),
            ),
          ],
        ),
        GoRoute(
          path: MovieDetailPage2.routeLocation.toChildRouteLocation(),
          builder: (context, state) => const MovieDetailPage2(),
        ),
      ],
    ),
  ],
);
