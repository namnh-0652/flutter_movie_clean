import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter_movie_clean/domain/model/tv_series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    List<Movie>? latestMovies,
    List<TvSeries>? latestSeries,
    List<Movie>? trendingMovies,
  }) = _HomeState;
}
