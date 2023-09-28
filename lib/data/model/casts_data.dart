import 'package:flutter_movie_clean/data/model/base_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'cast_data.dart';

part 'casts_data.freezed.dart';
part 'casts_data.g.dart';

@freezed
class CastsData extends BaseData with _$CastsData {
  const factory CastsData({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "cast") List<CastData>? casts,
  }) = _CastsData;

  factory CastsData.fromJson(Map<String, Object?> json) =>
      _$CastsDataFromJson(json);
}
