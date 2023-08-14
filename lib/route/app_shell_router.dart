import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/pages/categories/categories_page.dart';
import 'package:flutter_movie_clean/pages/favorites/favorites_page.dart';
import 'package:flutter_movie_clean/pages/home/home_page.dart';
import 'package:flutter_movie_clean/pages/more/more_page.dart';
import 'package:flutter_movie_clean/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/route/routes.dart';
import 'package:go_router/go_router.dart';

import '../pages/main/main_page_with_nav_bar.dart';
import '../pages/moviedetail/movie_detail_page2.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
final appRouterWithShellRoute = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: HomePage.routeLocation,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainPageWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: HomePage.routeLocation,
          builder: (context, state) {
            return const HomePage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: MovieDetailPage.routeLocation.toChildRouteLocation(),
              builder: (BuildContext context, GoRouterState state) {
                return const MovieDetailPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: CategoriesPage.routeLocation,
          builder: (BuildContext context, GoRouterState state) {
            return const CategoriesPage();
          },
          routes: <RouteBase>[
            // Displayed on the root Navigator by specifying the
            // [parentNavigatorKey].
            GoRoute(
              path: MovieDetailPage2.routeLocation.toChildRouteLocation(),
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const MovieDetailPage2();
              },
            ),
          ],
        ),
        GoRoute(
          path: FavoritesPage.routeLocation,
          builder: (BuildContext context, GoRouterState state) {
            return const FavoritesPage();
          },
        ),
        GoRoute(
          path: MorePage.routeLocation,
          builder: (BuildContext context, GoRouterState state) {
            return const MorePage();
          },
        ),
      ],
    ),
  ],
);
