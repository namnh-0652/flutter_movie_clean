import 'package:flutter_movie_clean/di/view_model_provider.dart';
import 'package:flutter_movie_clean/app_viewmodel.dart';
import 'package:flutter_movie_clean/presentation/pages/login/login_page.dart';
import 'package:flutter_movie_clean/presentation/pages/main/main_page.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/account/account_page.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_avatar/account_create_avatar_page.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_pin/account_create_pin_page.dart';
import 'package:flutter_movie_clean/presentation/pages/signup/signup.dart';
import 'package:flutter_movie_clean/presentation/pages/welcome_screen/welcome_screen.dart';
import 'package:flutter_movie_clean/presentation/route/account_graph.dart';
import 'package:flutter_movie_clean/shared/extensions/string_ext.dart';
import 'package:go_router/go_router.dart';

appRouter(ref) {
  String initLocation() {
    final appViewModel = ref.read<AppViewModel>(appViewModelProvider);
    if (appViewModel.isFistRunApp == true) {
      return WelcomeScreen.routeLocation;
    }
    if (appViewModel.account == null) {
      return LoginPage.routeLocation;
    }
    if (appViewModel.profile == null && appViewModel.account.profiles.isEmpty) {
      return AccountCreateAvatarPage.routeLocation;
    }

    if (appViewModel.profile == null &&
        appViewModel.account.profiles.isNotEmpty) {
      return AccountPage.routeLocation;
    }

    if (appViewModel.profile != null) {
      return MainPage.routeLocation;
    }
    return WelcomeScreen.routeLocation;
  }

  return GoRouter(
    initialLocation: initLocation(),
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
          final appViewModel = ref.read<AppViewModel>(appViewModelProvider);
          if (appViewModel.account == null) {
            return LoginPage.routeLocation;
          }
          if (appViewModel.profile == null) {
            return AccountCreatePinPage.routeLocation;
          }

          return MainPage.routeLocation;
        },
        builder: (context, state) => const MainPage(),
        routes: [
          GoRoute(
            path: MovieDetailPage.routeLocation.toSubRouteLocation(),
            name: MovieDetailPage.routeName,
            builder: (context, state) =>
                MovieDetailPage(movieId: state.extra as int),
          ),
        ],
      ),
      ...accountGraph
    ],
  );
}
