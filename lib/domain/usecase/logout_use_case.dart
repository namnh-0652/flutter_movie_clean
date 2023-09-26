import 'package:flutter_movie_clean/domain/interactor/input/empty_input.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

final class LogoutUseCase extends BaseUseCase<EmptyInput, void> {
  LogoutUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future buildUseCase(EmptyInput input) {
    return _userRepository.logout();
  }
}
