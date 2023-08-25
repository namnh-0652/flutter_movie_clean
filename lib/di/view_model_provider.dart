import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/pages/home/home_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose<HomeViewModel>(
  (ref) => HomeViewModel(ref.watch(getNowPlayingMoviesUseCaseProvider)),
);
