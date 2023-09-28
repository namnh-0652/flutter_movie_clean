import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_movie_clean/data/model/base_data.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData extends BaseData with _$UserData {
  const factory UserData({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);
}
