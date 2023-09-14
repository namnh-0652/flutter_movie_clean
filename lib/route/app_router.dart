import 'package:domain/model/movie.dart';
import 'package:flutter_movie_clean/pages/login/login.dart';
import 'package:flutter_movie_clean/pages/main/main_page.dart';
import 'package:flutter_movie_clean/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/pages/welcome_screen/welcome_screen.dart';
import 'package:flutter_movie_clean/pages/signup/signup.dart';
import 'package:flutter_movie_clean/shared/extensions/string_ext.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: WelcomeScreen.routeLocation,
  routes: [
    GoRoute(
      path: WelcomeScreen.routeLocation,
      name: WelcomeScreen.routeName,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: LoginPage.routeLocation,
      name: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignupPage.routeLocation,
      name: SignupPage.routeName,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: MainPage.routeLocation,
      name: MainPage.routeName,
      builder: (context, state) {
        var data = state.extra as Map<String, String>?;
        return MainPage(user: data?["user"] ?? "");
      },
      routes: [
        GoRoute(
          path: MovieDetailPage.routeLocation.toSubRouteLocation(),
          name: MovieDetailPage.routeName,
          builder: (context, state) => MovieDetailPage(movie: state.extra as Movie),
        ),
      ],
    ),
  ],
);
