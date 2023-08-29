import 'package:domain/model/movie.dart';
import 'package:domain/model/tv_series.dart';
import 'package:flutter_movie_clean/model/enums/category_type.dart';

class Poster {
  Poster({
    this.id,
    this.posterUrl,
    this.categoryType = CategoryType.movies,
  });

  final int? id;
  final String? posterUrl;
  final CategoryType? categoryType;

  factory Poster.fromMovie(Movie movie) {
    return Poster(
      id: movie.id,
      posterUrl: movie.posterPath,
      categoryType: CategoryType.movies,
    );
  }

  factory Poster.fromTvSeries(TvSeries tvSeries) {
    return Poster(
      id: tvSeries.id,
      posterUrl: tvSeries.posterPath,
      categoryType: CategoryType.series,
    );
  }
}
