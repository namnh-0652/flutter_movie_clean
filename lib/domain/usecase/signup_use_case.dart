import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/user.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

class SignupUseCase extends BaseUseCase<SignupUseCaseInput, User?> {
  SignupUseCase(this.userRepository);

  final UserRepository userRepository;

  @override
  Future<User?> buildUseCase(SignupUseCaseInput input) {
    return userRepository.signUp(
      email: input.email,
      password: input.password,
      avatar: input.avatar,
      nickname: input.nickname,
      pin: input.pin,
    );
  }
}

class SignupUseCaseInput extends BaseInput {
  const SignupUseCaseInput({
    required this.email,
    required this.password,
    required this.avatar,
    required this.nickname,
    required this.pin,
  });
  final String email;
  final String password;
  final String avatar;
  final String nickname;
  final String pin;
}
