import 'dart:convert';

import 'package:flutter_movie_clean/data/model/account_data.dart';
import 'package:flutter_movie_clean/data/model/profile_data.dart';
import 'package:flutter_movie_clean/data/repository/source/local/preference/shared_pref_key.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource {
  const UserLocalDataSource(
      {required this.sharedPreferences, required this.isar});

  final SharedPreferences sharedPreferences;
  final Isar isar;

  saveAccount(AccountData account) async {
    await sharedPreferences.setString(
      SharedPrefKey.accountToken,
      jsonEncode(account.toJson()),
    );
  }

  AccountData? getAccount() {
    final accountJsonString =
        sharedPreferences.getString(SharedPrefKey.accountToken);
    if (accountJsonString == null) return null;

    return AccountData.fromJson(jsonDecode((accountJsonString)));
  }

  Future<AccountData> login(
      {required String email, required String password}) async {
    final data = await isar.accountDatas
        .filter()
        .emailEqualTo(email)
        .passwordEqualTo(password)
        .findFirst();
    if (data == null) {
      throw const FormatException("The email or password!");
    }
    saveAccount(data);
    return data;
  }

  Future<AccountData> signup(
      {required String email, required String password}) async {
    final data =
        await isar.accountDatas.filter().emailEqualTo(email).findFirst();
    if (data != null) {
      throw const FormatException("The Email was registered!");
    }
    final newAccount = AccountData()
      ..email = email
      ..password = password;
    final id = await isar.writeTxn(() async {
      return await isar.accountDatas.put(newAccount);
    });
    saveAccount(newAccount..id = id);
    return newAccount;
  }

  Future<AccountData> updateAccount(
      {String? password, List<ProfileData>? profiles}) async {
    final account = getAccount();
    if (account == null) {
      throw const FormatException("User must login");
    }
    if (password != null && password.isNotEmpty) {
      account.password = password;
    }
    if (profiles != null) {
      account.profiles = profiles;
    }
    await isar.writeTxn(() async {
      return await isar.accountDatas.put(account);
    });
    saveAccount(account);
    return account;
  }

  Future<void> setIsFirstInstallApp() async {
    await sharedPreferences.setBool(SharedPrefKey.isFistRunAppToken, false);
  }

  bool getIsFirstInstallApp() {
    return sharedPreferences.getBool(SharedPrefKey.isFistRunAppToken) ?? true;
  }

  ProfileData? getProfile() {
    final profileJsonString =
        sharedPreferences.getString(SharedPrefKey.profileToken);
    if (profileJsonString == null) return null;

    return ProfileData.fromJson(jsonDecode((profileJsonString)));
  }

  Future saveProfile(ProfileData profile) async {
    await sharedPreferences.setString(
        SharedPrefKey.profileToken, jsonEncode(profile.toJson()));
  }

  Future logout() async {
    await sharedPreferences.remove(SharedPrefKey.accountToken);
    await sharedPreferences.remove(SharedPrefKey.profileToken);
  }
}
