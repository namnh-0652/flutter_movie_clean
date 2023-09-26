import 'package:flutter_movie_clean/app_viewmodel.dart';
import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/presentation/pages/categories/categories_view_model.dart';
import 'package:flutter_movie_clean/presentation/pages/home/home_view_model.dart';
import 'package:flutter_movie_clean/presentation/pages/login/login_view_model.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/movie_detail_view_model.dart';
import 'package:flutter_movie_clean/presentation/pages/signup/singup_view_model.dart';
import 'package:flutter_movie_clean/presentation/pages/welcome_screen/welcome_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose<HomeViewModel>(
  (ref) => HomeViewModel(
    ref.watch(getLatestMoviesUseCaseProvider),
    ref.watch(getLatestSeriesUseCaseProvider),
    ref.watch(getTrendingMoviesUseCaseProvider),
  ),
);

final categoriesViewModelProvider =
    ChangeNotifierProvider.autoDispose<CategoriesViewModel>(
  (ref) => CategoriesViewModel(
    ref.watch(getSortedMoviesUseCaseProvider),
    ref.watch(getSortedSeriesUseCaseProvider),
  ),
);

final movieDetailViewModelProvider =
    ChangeNotifierProvider.autoDispose.family<MovieDetailViewModel, int>(
  (ref, movieId) => MovieDetailViewModel(
    ref.watch(getMovieDetailUseCaseProvider),
    ref.watch(getCastsUseCaseProvider),
    ref.watch(getSimilarUseCaseProvider),
  ),
);

final appViewModelProvider = ChangeNotifierProvider<AppViewModel>(
  (ref) => AppViewModel(
      getAccountUseCase: ref.watch(getAccountUseCaseProvider),
      getIsFirstRunAppUseCase: ref.watch(getIsFirstRunAppUseCaseProvider),
      getProfileUseCase: ref.watch(getProfileUseCaseProvider),
      saveProfileUseCase: ref.watch(saveProfileUseCaseProvider),
      updateAccountUseCase: ref.watch(updateAccountUseCaseProvider),
      logoutUseCase: ref.watch(logoutUseCaseProvider)),
);

final loginViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => LoginViewModel(ref.watch(loginUseCase)),
);

final signupViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => SignupViewModel(ref.watch(singupUseCase)),
);

final welcomeViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => WelcomeViewModel(
    setIsFirstRunAppUseCase: ref.watch(setIsFirstRunAppUseCaseProvider),
  ),
);
