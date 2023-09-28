import 'package:flutter_movie_clean/data/model/base_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_data.freezed.dart';
part 'movie_data.g.dart';

@freezed
class MovieData extends BaseData with _$MovieData {
  const factory MovieData({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    @JsonKey(name: "original_language") String? originalLanguage,
    @JsonKey(name: "original_title") String? originalTitle,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "overview") String? overview,
    @JsonKey(name: "release_date") String? releaseDate,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
    @JsonKey(name: "video") bool? isVideo,
    @JsonKey(name: "adult") bool? isAdult,
  }) = _MovieData;

  factory MovieData.fromJson(Map<String, Object?> json) =>
      _$MovieDataFromJson(json);
}
