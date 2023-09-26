import 'package:flutter_movie_clean/data/model/base_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_data.freezed.dart';
part 'tv_series_data.g.dart';

@freezed
class TvSeriesData extends BaseData with _$TvSeriesData {
  const factory TvSeriesData({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    @JsonKey(name: "original_language") String? originalLanguage,
    @JsonKey(name: "original_name") String? originalName,
    @JsonKey(name: "origin_Country") List<String>? originCountries,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "overview") String? overview,
    @JsonKey(name: "genre_ids") List<int>? genreIds,
    @JsonKey(name: "first_air_date") String? firstAirDate,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
    @JsonKey(name: "popularity") double? popularity,
  }) = _TvSeriesData;

  factory TvSeriesData.fromJson(Map<String, Object?> json) =>
      _$TvSeriesDataFromJson(json);
}
