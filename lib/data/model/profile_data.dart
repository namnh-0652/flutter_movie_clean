import 'package:flutter_movie_clean/data/model/base_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'profile_data.g.dart';

@JsonSerializable()
@embedded
class ProfileData extends BaseData {
  ProfileData({
    @JsonKey(name: "username") this.username,
    @JsonKey(name: "image_path") this.imagePath,
    @JsonKey(name: "password") this.password,
    @JsonKey(name: "pint") this.pin,
  });

  final String? username;
  final String? imagePath;
  final String? password;
  final String? pin;

  factory ProfileData.fromJson(Map<String, Object?> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
