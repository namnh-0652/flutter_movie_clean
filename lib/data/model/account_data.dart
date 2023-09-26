import 'package:flutter_movie_clean/data/model/base_data.dart';
import 'package:flutter_movie_clean/data/model/profile_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'account_data.g.dart';

@collection
@JsonSerializable()
class AccountData extends BaseData {
  AccountData({
    @JsonKey(name: "email") this.email,
    @JsonKey(name: "password") this.password,
    @JsonKey(name: "profiles") this.profiles = const [],
  });
  Id id = Isar.autoIncrement;
  @Index(unique: true)
  late String? email;
  late String? password;
  late List<ProfileData> profiles;

  factory AccountData.fromJson(Map<String, dynamic> json) =>
      _$AccountDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataToJson(this);
}
