import 'package:flutter_movie_clean/domain/model/account_model.dart';
import 'package:flutter_movie_clean/domain/usecase/login_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/base/base_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel(this._loginUseCase);

  final LoginUseCase _loginUseCase;

  AsyncValue<Account?>? accountState;

  login({required String email, required String password}) {
    launchUseCase(
      useCase: _loginUseCase,
      input: LoginUseCaseInput(email: email, password: password),
      onSubscribe: () => accountState = const AsyncValue.loading(),
      onSuccess: (value) => accountState = AsyncValue.data(value),
      onError: (error) =>
          accountState = AsyncValue.error(error, StackTrace.empty),
    );
  }
}
