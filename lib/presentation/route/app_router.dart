import 'package:flutter_movie_clean/presentation/pages/login/login.dart';
import 'package:flutter_movie_clean/presentation/pages/main/main_page.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/presentation/pages/welcome_screen/welcome_screen.dart';
import 'package:flutter_movie_clean/presentation/pages/signup/signup.dart';
import 'package:flutter_movie_clean/presentation/route/account_graph.dart';
import 'package:flutter_movie_clean/shared/extensions/string_ext.dart';
import 'package:flutter_movie_clean/shared/utils/function.dart';
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
      redirect: (context, state) {
        var data = castOrNull<Map<String, String?>>(state.extra);
        var user = data?["username"];
        if (user == null) {
          return LoginPage.routeLocation;
        }
        return MainPage.routeLocation;
      },
      builder: (context, state) {
        var data = castOrNull<Map<String, String?>>(state.extra);
        return MainPage(user: data?["username"] ?? "");
      },
      routes: [
        GoRoute(
          path: MovieDetailPage.routeLocation.toSubRouteLocation(),
          name: MovieDetailPage.routeName,
          builder: (context, state) => MovieDetailPage(movieId: state.extra as int),
        ),
      ],
    ),
    ...accountGraph
    // /
  ],
);
