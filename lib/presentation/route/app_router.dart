import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/presentation/pages/base/app_view_model.dart';
import 'package:flutter_movie_clean/presentation/pages/login/login.dart';
import 'package:flutter_movie_clean/presentation/pages/main/main_page.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/presentation/pages/welcome_screen/welcome_screen.dart';
import 'package:flutter_movie_clean/presentation/pages/signup/signup.dart';
import 'package:flutter_movie_clean/presentation/route/account_graph.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appStateProvider = StateNotifierProvider((ref) {
  return AppViewModel(
    ref.watch(getLocalUserUseCaseProvider),
    ref.watch(hasCompletedBoadingUseCaseProvider),
    ref.watch(completeBoadingUseCaseProvider),
  )..init();
});

final appRouterProvider = Provider<GoRouter>((ref) {
  final appState = ref.watch(appStateProvider.notifier);
  return GoRouter(
    initialLocation: WelcomeScreen.routeLocation,
    redirect: (context, state) {
      if (state.fullPath == WelcomeScreen.routeLocation) {
        if (appState.isProfileLoaded()) {
          return MainPage.routeLocation;
        } else if (appState.isOnboarded()) {
          return LoginPage.routeLocation;
        }
      } else if (appState.isInitialized()) {
        return WelcomeScreen.routeLocation;
      }
      return null;
    },
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
        path: MovieDetailPage.routeLocation,
        name: MovieDetailPage.routeName,
        builder: (context, state) =>
            MovieDetailPage(movieId: state.extra as int),
      ),
      GoRoute(
        path: MainPage.routeLocation,
        name: MainPage.routeName,
        builder: (context, state) => const MainPage(),
      ),
      ...accountGraph
      // /
    ],
  );
});
