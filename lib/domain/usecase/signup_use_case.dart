import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/account_model.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

class SignupUseCase extends BaseUseCase<SignupUseCaseInput, Account?> {
  SignupUseCase(this.userRepository);

  final UserRepository userRepository;

  @override
  Future<Account?> buildUseCase(SignupUseCaseInput input) {
    return userRepository.signup(email: input.email, password: input.password);
  }
}

class SignupUseCaseInput extends BaseInput {
  const SignupUseCaseInput({required this.email, required this.password});

  final String email;
  final String password;
}
