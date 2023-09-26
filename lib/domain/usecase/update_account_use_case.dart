import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/account_model.dart';
import 'package:flutter_movie_clean/domain/model/profile_model.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

final class UpdateAccountUseCase
    extends BaseUseCase<UpdateAccountInput, Account> {
  UpdateAccountUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<Account> buildUseCase(UpdateAccountInput input) {
    return _userRepository.updateAccount(
      password: input.password,
      profiles: input.profiles,
    );
  }
}

final class UpdateAccountInput extends BaseInput {
  const UpdateAccountInput({this.password, this.profiles});
  final String? password;
  final List<Profile>? profiles;
}
