import 'package:flutter_movie_clean/domain/model/casts.dart';
import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_state.freezed.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState({
    @Default(null) Object? error,
    @Default(null) Movie? movie,
    @Default(null) List<Movie>? similarMovies,
    @Default(null) Casts? casts,
  }) = _DetailState;
}
