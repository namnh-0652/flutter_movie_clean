import 'dart:convert';

import 'package:flutter_movie_clean/data/model/user_data.dart';
import 'package:flutter_movie_clean/data/repository/source/local/preference/shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSource(this.sharedPreferences);

  Future<void> saveUser(UserData user) async {
    sharedPreferences.setString(SharedPrefKey.prefKeyUser, jsonEncode(user));
  }

  Future<UserData?> getUser() async {
    final userData = sharedPreferences.getString(SharedPrefKey.prefKeyUser);
    if (userData != null) {
      return UserData.fromJson(jsonDecode(userData) as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<void> removeUser() {
    return sharedPreferences.remove(SharedPrefKey.prefKeyUser);
  }

  Future<void> completeBoarding() {
    return sharedPreferences.setBool(
        SharedPrefKey.prefHasCompletedBoarding, true);
  }

  Future<bool> hasCompletedBoarding() async {
    return sharedPreferences.getBool(SharedPrefKey.prefHasCompletedBoarding) ==
        true;
  }
}
