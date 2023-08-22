import 'package:data/mapper/movie_mapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieMapperProvider = Provider<MovieMapper>(
  (ref) => MovieMapper(),
);
