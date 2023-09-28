import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_noinput_use_case.dart';

class SignOutUseCase extends BaseNoInputUseCase<void> {
  SignOutUseCase(this.userRepository);

  final UserRepository userRepository;

  @override
  Future<void> buildUseCase() {
    return userRepository.signOut();
  }
}
