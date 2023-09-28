import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_direct_noinput_use_case.dart';

class CompleteBoadingUseCase extends BaseDirectNoInputUseCase<void> {
  CompleteBoadingUseCase(this.userRepository);

  final UserRepository userRepository;

  @override
  Future<void> invoke() {
    return userRepository.completeBoarding();
  }
}
