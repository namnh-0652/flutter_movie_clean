import 'package:domain/usecase/get_now_playing_movies_use_case.dart';
import 'package:flutter_movie_clean/di/repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getNowPlayingMoviesUseCaseProvider = Provider<GetNowPlayingMoviesUseCase>(
  (ref) => GetNowPlayingMoviesUseCase(ref.watch(movieRepositoryProvider)),
);
