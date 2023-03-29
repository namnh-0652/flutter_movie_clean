import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/moviedetails/components/youtube_player_view.dart';
import 'package:go_router/go_router.dart';

import '../exports/screens.dart';
import '../widgets/scaffold_with_nav_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
const ValueKey<String> _scaffoldKey = ValueKey<String>('App scaffold');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: 'on_boarding',
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const OnBoardingScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
            name: 'home',
            path: '/home',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return FadeTransitionPage(
                key: _scaffoldKey,
                child: const HomeScreen(),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                  name: 'movie_details',
                  path: 'movie_details',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) =>
                      const MovieDetailsScreen(),
                  routes: <RouteBase>[
                    GoRoute(
                      name: 'youtube_player',
                      path: 'youtube_player/:id',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) =>
                          YoutubePlayerView(trailerId: state.params['id']!),
                    ),
                  ]),
            ]),
        GoRoute(
            name: 'categories',
            path: '/categories',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return FadeTransitionPage(
                key: _scaffoldKey,
                child: const CategoriesScreen(),
              );
            }),
        GoRoute(
            name: 'downloads',
            path: '/downloads',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return FadeTransitionPage(
                key: _scaffoldKey,
                child: const DownloadsScreen(),
              );
            }),
        GoRoute(
            name: 'more',
            path: '/more',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return FadeTransitionPage(
                key: _scaffoldKey,
                child: const MoreScreen(),
              );
            }),
      ],
    ),
  ],
);

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(
            opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
            child: child,
          );
        });
}
