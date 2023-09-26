import 'package:flutter_movie_clean/domain/interactor/input/empty_input.dart';
import 'package:flutter_movie_clean/domain/usecase/set_is_first_run_app_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/base/base_view_model.dart';

class WelcomeViewModel extends BaseViewModel {
  WelcomeViewModel({required SetIsFirstRunAppUseCase setIsFirstRunAppUseCase})
      : _setIsFirstRunAppUseCase = setIsFirstRunAppUseCase;

  final SetIsFirstRunAppUseCase _setIsFirstRunAppUseCase;

  setIsFirstRunAppUseCase() {
    launchUseCase(
        useCase: _setIsFirstRunAppUseCase, input: EmptyInput.instance);
  }
}
