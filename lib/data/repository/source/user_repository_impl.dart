import 'package:flutter_movie_clean/data/mapper/account_mapper.dart';
import 'package:flutter_movie_clean/data/repository/source/local/user_local_data_source.dart';
import 'package:flutter_movie_clean/domain/model/account_model.dart';
import 'package:flutter_movie_clean/domain/model/profile_model.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.accountMapper,
    required this.userLocalDataSource,
    required this.profileMapper,
  });

  final UserLocalDataSource userLocalDataSource;
  final AccountMapper accountMapper;
  final ProfileMapper profileMapper;

  @override
  Account? getAccount() {
    return accountMapper.mapOrNull(userLocalDataSource.getAccount());
  }

  @override
  saveAccount(Account account) async {
    return await userLocalDataSource
        .saveAccount(accountMapper.mapToData(account));
  }

  @override
  Future<Account?> login(
      {required String email, required String password}) async {
    final accountData = await userLocalDataSource.login(
      email: email,
      password: password,
    );

    return accountMapper.mapOrNull(accountData);
  }

  @override
  Future<Account?> signup(
      {required String email, required String password}) async {
    final accountData = await userLocalDataSource.signup(
      email: email,
      password: password,
    );

    return accountMapper.mapOrNull(accountData);
  }

  @override
  Future<Account> updateAccount(
      {String? password, List<Profile>? profiles}) async {
    final accountData = await userLocalDataSource.updateAccount(
      password: password,
      profiles: profileMapper.mapToListDataOrNull(profiles),
    );

    return accountMapper.map(accountData);
  }

  @override
  bool getIsFirstRunApp() {
    return userLocalDataSource.getIsFirstInstallApp();
  }

  @override
  Future setIsFirstRunApp() {
    return userLocalDataSource.setIsFirstInstallApp();
  }

  @override
  Profile? getProfile() {
    return profileMapper.mapOrNull(userLocalDataSource.getProfile());
  }

  @override
  Future saveProfile(Profile profile) async {
    await userLocalDataSource.saveProfile(profileMapper.mapToData(profile));
  }

  @override
  Future logout() async {
    await userLocalDataSource.logout();
  }
}
