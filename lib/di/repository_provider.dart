import 'package:data/repository/movie_repository_impl.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieRepositoryProvider = Provider<MovieRepository>(
  (ref) => MovieRepositoryImpl(),
);
