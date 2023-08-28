import 'package:data/mapper/movie_mapper.dart';
import 'package:data/mapper/tv_series_mapper.dart';
import 'package:flutter_movie_clean/di/app_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieMapperProvider = Provider<MovieMapper>((ref) {
  final envConfigs = ref.watch(envConfigsProvider);
  return MovieMapper(envConfigs.baseImageUrl);
});

final tvSeriesMapperProvider = Provider<TvSeriesMapper>((ref) {
  final envConfigs = ref.watch(envConfigsProvider);
  return TvSeriesMapper(envConfigs.baseImageUrl);
});
