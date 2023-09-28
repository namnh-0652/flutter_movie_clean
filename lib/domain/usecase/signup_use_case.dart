import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/user.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

class SignupUseCase extends BaseUseCase<SignupUseCaseInput, User?> {
  SignupUseCase(this.userRepository);

  final UserRepository userRepository;

  @override
  Future<User?> buildUseCase(SignupUseCaseInput input) {
    return userRepository.signUp(input.email, input.password);
  }
}

class SignupUseCaseInput extends BaseInput {
  const SignupUseCaseInput({required this.email, required this.password});
  final String email;
  final String password;
}
