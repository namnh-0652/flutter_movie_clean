import 'package:domain/model/base_model.dart';

class TvSeries extends BaseModel {
  TvSeries({
    this.id,
    this.posterPath,
    this.backdropPath,
    this.originalLanguage,
    this.originalName,
    this.originCountries,
    this.name,
    this.overview,
    this.genreIds,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.popularity,
  });

  final int? id;
  final String? posterPath;
  final String? backdropPath;
  final String? originalLanguage;
  final String? originalName;
  final List<String>? originCountries;
  final String? name;
  final String? overview;
  final List<int>? genreIds;
  final String? firstAirDate;
  final double? voteAverage;
  final int? voteCount;
  final double? popularity;
}
