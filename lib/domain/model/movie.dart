import 'package:flutter_movie_clean/domain/model/base_model.dart';

class Movie extends BaseModel {
  Movie({
    this.id,
    this.posterPath,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.title,
    this.overview,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.isVideo,
    this.isAdult,
  });

  final int? id;
  final String? posterPath;
  final String? backdropPath;
  final String? originalLanguage;
  final String? originalTitle;
  final String? title;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final bool? isAdult;
  final bool? isVideo;
}
