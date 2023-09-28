import 'package:flutter_movie_clean/domain/model/user.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_direct_noinput_use_case.dart';

class GetLocalUserUseCase extends BaseDirectNoInputUseCase<User?> {
  GetLocalUserUseCase(this.userRepository);

  final UserRepository userRepository;

  @override
  Future<User?> invoke() {
    return userRepository.getLocalUser();
  }
}
