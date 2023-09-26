import 'package:flutter_movie_clean/domain/interactor/input/empty_input.dart';
import 'package:flutter_movie_clean/domain/repository/user_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_direct_use_case.dart';

final class GetIsFirstRunAppUseCase
    extends BaseDirectUseCase<EmptyInput, bool> {
  GetIsFirstRunAppUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  bool buildUseCase(EmptyInput input) {
    return _userRepository.getIsFirstRunApp();
  }
}
