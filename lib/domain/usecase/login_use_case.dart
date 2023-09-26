import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/account_model.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

class LoginUseCase extends BaseUseCase<LoginUseCaseInput, Account?> {
  LoginUseCase(this.userRepository);

  final UserRepository userRepository;

  @override
  buildUseCase(LoginUseCaseInput input) {
    return userRepository.login(email: input.email, password: input.password);
  }
}

class LoginUseCaseInput extends BaseInput {
  const LoginUseCaseInput({required this.email, required this.password});

  final String email;
  final String password;
}
