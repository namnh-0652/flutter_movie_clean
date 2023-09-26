import 'package:flutter_movie_clean/domain/usecase/get_account_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_is_first_run_app_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_casts_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_series_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_profile_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_sorted_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_sorted_series_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_trending_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_similar_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_movie_detail_use_case.dart';
import 'package:flutter_movie_clean/di/repository_provider.dart';
import 'package:flutter_movie_clean/domain/usecase/login_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/logout_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/save_profile_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/set_is_first_run_app_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/signup_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/update_account_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getLatestMoviesUseCaseProvider = Provider<GetLatestMoviesUseCase>(
  (ref) => GetLatestMoviesUseCase(ref.watch(movieRepositoryProvider)),
);

final getLatestSeriesUseCaseProvider = Provider<GetLatestSeriesUseCase>(
  (ref) => GetLatestSeriesUseCase(ref.watch(movieRepositoryProvider)),
);

final getTrendingMoviesUseCaseProvider = Provider<GetTrendingMoviesUseCase>(
  (ref) => GetTrendingMoviesUseCase(ref.watch(movieRepositoryProvider)),
);

final getSortedMoviesUseCaseProvider = Provider<GetSortedMoviesUseCase>(
  (ref) => GetSortedMoviesUseCase(ref.watch(movieRepositoryProvider)),
);

final getSortedSeriesUseCaseProvider = Provider<GetSortedSeriesUseCase>(
  (ref) => GetSortedSeriesUseCase(ref.watch(movieRepositoryProvider)),
);

final getMovieDetailUseCaseProvider = Provider<GetMovieDetailUseCase>(
  (ref) => GetMovieDetailUseCase(ref.watch(movieRepositoryProvider)),
);

final getSimilarUseCaseProvider = Provider<GetSimilarMoviesUseCase>(
  (ref) => GetSimilarMoviesUseCase(ref.watch(movieRepositoryProvider)),
);

final getCastsUseCaseProvider = Provider<GetCastsUseCase>(
  (ref) => GetCastsUseCase(ref.watch(movieRepositoryProvider)),
);

final loginUseCase = Provider<LoginUseCase>(
  (ref) => LoginUseCase(ref.watch(userRepositoryProvider)),
);

final singupUseCase = Provider<SignupUseCase>(
  (ref) => SignupUseCase(ref.watch(userRepositoryProvider)),
);

final updateAccountUseCaseProvider = Provider<UpdateAccountUseCase>(
  (ref) => UpdateAccountUseCase(ref.watch(userRepositoryProvider)),
);

final getIsFirstRunAppUseCaseProvider = Provider<GetIsFirstRunAppUseCase>(
  (ref) => GetIsFirstRunAppUseCase(ref.watch(userRepositoryProvider)),
);

final setIsFirstRunAppUseCaseProvider = Provider<SetIsFirstRunAppUseCase>(
  (ref) => SetIsFirstRunAppUseCase(ref.watch(userRepositoryProvider)),
);

final getAccountUseCaseProvider = Provider<GetAccountUseCase>(
  (ref) => GetAccountUseCase(ref.watch(userRepositoryProvider)),
);

final getProfileUseCaseProvider = Provider<GetProfileUseCase>(
  (ref) => GetProfileUseCase(ref.watch(userRepositoryProvider)),
);

final saveProfileUseCaseProvider = Provider<SaveProfileUseCase>(
  (ref) => SaveProfileUseCase(ref.watch(userRepositoryProvider)),
);

final logoutUseCaseProvider = Provider(
  (ref) => LogoutUseCase(ref.watch(userRepositoryProvider)),
);
