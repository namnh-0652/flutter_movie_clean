import 'package:flutter_movie_clean/data/mapper/user_mapper.dart';
import 'package:flutter_movie_clean/data/repository/source/local/user_local_data_source.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/user_remote_data_source.dart';
import 'package:flutter_movie_clean/domain/model/user.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(
      this._userLocalDataSource, this._userRemoteDataSource, this._userMapper);
  final UserLocalDataSource _userLocalDataSource;
  final UserRemoteDataSource _userRemoteDataSource;
  final UserMapper _userMapper;

  @override
  Future<void> completeBoarding() async {
    return await _userLocalDataSource.completeBoarding();
  }

  @override
  Future<bool> hasCompletedBoarding() async {
    return await _userLocalDataSource.hasCompletedBoarding();
  }

  @override
  Future<User?> signIn(String email, String password) async {
    final userData = await _userRemoteDataSource.signIn(email, password);
    await _userLocalDataSource.saveUser(userData);
    return _userMapper.map(userData);
  }

  @override
  Future<User?> signUp({
    required String email,
    required String password,
    required String avatar,
    required String nickname,
    required String pin,
  }) async {
    final userData = await _userRemoteDataSource.signUp(
      email: email,
      password: password,
      avatar: avatar,
      nickname: nickname,
      pin: pin,
    );
    await _userLocalDataSource.saveUser(userData);
    return _userMapper.map(userData);
  }

  @override
  Future<void> signOut() async {
    await _userRemoteDataSource.signOut();
    await _userLocalDataSource.removeUser();
  }

  @override
  Future<User?> getLocalUser() async {
    final userData = await _userLocalDataSource.getUser();
    if (userData != null) {
      return _userMapper.map(userData);
    } else {
      return null;
    }
  }
}
