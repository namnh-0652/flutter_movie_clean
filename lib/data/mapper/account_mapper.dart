import 'package:flutter_movie_clean/data/mapper/base_mapper.dart';
import 'package:flutter_movie_clean/data/model/account_data.dart';
import 'package:flutter_movie_clean/data/model/profile_data.dart';
import 'package:flutter_movie_clean/domain/model/account_model.dart';
import 'package:flutter_movie_clean/domain/model/profile_model.dart';

class AccountMapper extends BaseMapper<AccountData, Account> {
  AccountMapper({required this.profileMapper});

  final ProfileMapper profileMapper;

  @override
  Account map(AccountData data) {
    return Account(
        email: data.email,
        password: data.password,
        profiles: profileMapper.mapList(data.profiles));
  }

  AccountData mapToData(Account data) {
    return AccountData(
        email: data.email,
        password: data.password,
        profiles: profileMapper.mapToListData(data.profiles));
  }
}

class ProfileMapper extends BaseMapper<ProfileData, Profile> {
  @override
  Profile map(ProfileData data) {
    return Profile(
      username: data.username,
      imagePath: data.imagePath,
      password: data.password,
      pin: data.pin,
    );
  }

  ProfileData mapToData(Profile data) {
    return ProfileData(
      username: data.username,
      imagePath: data.imagePath,
      password: data.password,
      pin: data.pin,
    );
  }

  List<ProfileData> mapToListData(List<Profile> profiles) {
    return profiles.map((e) => mapToData(e)).toList();
  }

  List<ProfileData>? mapToListDataOrNull(List<Profile>? profiles) {
    if (profiles == null) return null;

    return profiles.map((e) => mapToData(e)).toList();
  }
}
