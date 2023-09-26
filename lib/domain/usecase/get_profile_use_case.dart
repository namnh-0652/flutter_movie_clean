import 'package:flutter_movie_clean/domain/interactor/input/empty_input.dart';
import 'package:flutter_movie_clean/domain/model/profile_model.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_direct_use_case.dart';

final class GetProfileUseCase extends BaseDirectUseCase<EmptyInput, Profile?> {
  GetProfileUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Profile? buildUseCase(EmptyInput input) {
    return _userRepository.getProfile();
  }
}
