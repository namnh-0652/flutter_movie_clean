import 'package:flutter_movie_clean/domain/model/account_model.dart';
import 'package:flutter_movie_clean/domain/usecase/signup_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/base/base_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupViewModel extends BaseViewModel {
  SignupViewModel(this._signupUseCase);

  final SignupUseCase _signupUseCase;

  AsyncValue<Account?>? accountState;

  signup({required String email, required String password}) {
    launchUseCase(
      useCase: _signupUseCase,
      input: SignupUseCaseInput(email: email, password: password),
      onSubscribe: () => accountState = const AsyncValue.loading(),
      onSuccess: (value) => accountState = AsyncValue.data(value),
      onError: (error) =>
          accountState = AsyncValue.error(error, StackTrace.empty),
    );
  }
}
