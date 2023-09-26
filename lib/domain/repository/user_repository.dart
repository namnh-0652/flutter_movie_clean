import 'package:flutter_movie_clean/domain/model/account_model.dart';
import 'package:flutter_movie_clean/domain/model/profile_model.dart';

abstract class UserRepository {
  Future<void> saveAccount(Account account);

  Future<Account?> login({required String email, required String password});

  Future<Account?> signup({required String email, required String password});

  Account? getAccount();

  Profile? getProfile();

  Future<Account> updateAccount({String? password, List<Profile>? profiles});

  Future setIsFirstRunApp();

  bool getIsFirstRunApp();

  Future saveProfile(Profile profile);

  Future logout();
}
