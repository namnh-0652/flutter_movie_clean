import 'package:flutter_movie_clean/configs/env_configs.dart';
import 'package:flutter_movie_clean/data/mapper/cast_mapper.dart';
import 'package:flutter_movie_clean/data/mapper/casts_maper.dart';
import 'package:flutter_movie_clean/data/mapper/movie_mapper.dart';
import 'package:flutter_movie_clean/data/mapper/tv_series_mapper.dart';
import 'package:flutter_movie_clean/di2/service_locator.dart';

void setupMapperModule() {
  locator.registerLazySingleton(() => CastMapper(EnvConfigs.baseUrl));
  locator.registerLazySingleton(() => CastsMapper(locator()));
  locator.registerLazySingleton(() => MovieMapper(EnvConfigs.baseImageUrl));
  locator.registerLazySingleton(() => TvSeriesMapper(EnvConfigs.baseImageUrl));
}
