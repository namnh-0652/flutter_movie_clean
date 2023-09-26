import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/profile_model.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

final class SaveProfileUseCase extends BaseUseCase<SaveProfileInput, void> {
  SaveProfileUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> buildUseCase(SaveProfileInput input) {
    return _userRepository.saveProfile(input.profile);
  }
}

final class SaveProfileInput extends BaseInput {
  SaveProfileInput(this.profile);

  Profile profile;
}
