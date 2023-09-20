import 'package:flutter_movie_clean/data/mapper/base_mapper.dart';
import 'package:flutter_movie_clean/data/model/movie_data.dart';
import 'package:flutter_movie_clean/domain/model/movie.dart';

class MovieMapper extends BaseMapper<MovieData, Movie> {
  MovieMapper(this.baseImageUrl);

  final String baseImageUrl;

  @override
  Movie map(MovieData data) {
    return Movie(
      id: data.id,
      posterPath: data.posterPath == null ? null : "$baseImageUrl${data.posterPath}",
      backdropPath: data.backdropPath == null ? null : "$baseImageUrl${data.backdropPath}",
      originalTitle: data.originalTitle,
      title: data.title,
      overview: data.overview,
      releaseDate: data.releaseDate,
      voteAverage: data.voteAverage,
      voteCount: data.voteCount,
      isVideo: data.isVideo,
      isAdult: data.isAdult,
    );
  }
}
