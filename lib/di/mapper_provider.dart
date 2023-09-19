import 'package:flutter_movie_clean/data/mapper/cast_mapper.dart';
import 'package:flutter_movie_clean/data/mapper/casts_maper.dart';
import 'package:flutter_movie_clean/data/mapper/movie_mapper.dart';
import 'package:flutter_movie_clean/data/mapper/tv_series_mapper.dart';
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

final castsMapperProvider = Provider<CastsMapper>((ref) {
  return CastsMapper(ref.read(castMapperProvider));
});

final castMapperProvider = Provider<CastMapper>((ref) {
  final envConfigs = ref.watch(envConfigsProvider);
  return CastMapper(envConfigs.baseImageUrl);
});
