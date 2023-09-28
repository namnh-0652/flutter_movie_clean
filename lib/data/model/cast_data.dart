import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_movie_clean/data/model/base_data.dart';

part 'cast_data.freezed.dart';
part 'cast_data.g.dart';

@freezed
class CastData extends BaseData with _$CastData {
  const factory CastData({
    @JsonKey(name: "adult") bool? isAdult,
    @JsonKey(name: "gender") int? gender,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "known_for_department") String? knownForDepartment,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "original_name") String? originalName,
    @JsonKey(name: "profile_path") String? profilePath,
    @JsonKey(name: "character") String? character,
  }) = _CastData;

  factory CastData.fromJson(Map<String, Object?> json) =>
      _$CastDataFromJson(json);
}
