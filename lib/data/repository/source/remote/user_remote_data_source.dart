// ignore_for_file: unused_field

import 'package:flutter_movie_clean/data/model/user_data.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/auth_api.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/un_auth_api.dart';

class UserRemoteDataSource {
  final UnAuthApi _unAuthApi;
  final AuthApi _authApi;

  UserRemoteDataSource(this._unAuthApi, this._authApi);

  Future<UserData> signUp(String email, String password) async {
    final fakeUserData = UserData.fromJson(
      Map<String, String>.of(
          <String, String>{"email": email, "password": password}),
    );
    return fakeUserData;
  }

  Future<UserData> signIn(String email, String password) async {
    final fakeUserData = UserData.fromJson(
      Map<String, String>.of(
          <String, String>{"email": email, "password": password}),
    );
    return fakeUserData;
  }

  Future<void> signOut() async {
    // fake always success
    return Future.value();
  }
}
