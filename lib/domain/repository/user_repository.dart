import 'package:flutter_movie_clean/domain/model/user.dart';

abstract class UserRepository {
  Future<void> completeBoarding();
  Future<bool> hasCompletedBoarding();
  Future<User?> signIn(String email, String password);
  Future<User?> signUp({
    required String email,
    required String password,
    required String avatar,
    required String nickname,
    required String pin,
  });
  Future<User?> getLocalUser();
  Future<void> signOut();
}
