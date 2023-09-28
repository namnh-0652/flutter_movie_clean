import 'package:flutter_movie_clean/domain/model/user.dart';

abstract class UserRepository {
  Future<void> completeBoarding();
  Future<bool> hasCompletedBoarding();
  Future<User?> signIn(String email, String password);
  Future<User?> signUp(String email, String password);
  Future<User?> getLocalUser();
  Future<void> signOut();
}
