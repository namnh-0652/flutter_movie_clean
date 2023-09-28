import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_direct_noinput_use_case.dart';

class HasCompletedBoadingUseCase extends BaseDirectNoInputUseCase<bool> {
  HasCompletedBoadingUseCase(this.userRepository);

  final UserRepository userRepository;

  @override
  Future<bool> invoke() {
    return userRepository.hasCompletedBoarding();
  }
}
