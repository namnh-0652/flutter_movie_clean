import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter_movie_clean/domain/model/tv_series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(null) Object? error,
    @Default(null) List<Movie>? latestMovies,
    @Default(null) List<Movie>? trendingMovies,
    @Default(null) List<TvSeries>? tvSeries,
  }) = _HomeState;
}
