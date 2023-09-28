import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/user.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

class SignInUseCase extends BaseUseCase<SignInUseCaseInput, User?> {
  SignInUseCase(this.userRepository);
  final UserRepository userRepository;

  @override
  Future<User?> buildUseCase(SignInUseCaseInput input) {
    return userRepository.signIn(input.email, input.password);
  }
}

class SignInUseCaseInput extends BaseInput {
  const SignInUseCaseInput({required this.email, required this.password});
  final String email;
  final String password;
}
