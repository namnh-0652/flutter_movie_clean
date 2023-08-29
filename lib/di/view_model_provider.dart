import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/pages/categories/categories_view_model.dart';
import 'package:flutter_movie_clean/pages/home/home_view_model.dart';
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
