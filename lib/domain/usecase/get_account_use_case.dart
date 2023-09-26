import 'package:flutter_movie_clean/domain/interactor/input/empty_input.dart';
import 'package:flutter_movie_clean/domain/model/account_model.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_direct_use_case.dart';

final class GetAccountUseCase extends BaseDirectUseCase<EmptyInput, Account?> {
  GetAccountUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Account? buildUseCase(EmptyInput input) {
    return _userRepository.getAccount();
  }
}
