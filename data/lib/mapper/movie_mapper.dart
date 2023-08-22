import 'package:data/mapper/base_mapper.dart';
import 'package:data/model/movie_data.dart';
import 'package:domain/model/movie.dart';

class MovieMapper extends BaseMapper<MovieData, Movie> {
  // TODO Update base image url later
  @override
  Movie map(MovieData data) {
    return Movie(
      id: data.id,
      posterPath: "https://image.tmdb.org/t/p/w500${data.posterPath ?? ""}",
      backdropPath: "https://image.tmdb.org/t/p/w500${data.backdropPath ?? ""}",
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