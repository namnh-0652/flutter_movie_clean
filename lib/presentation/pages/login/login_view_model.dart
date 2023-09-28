import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';
import 'package:flutter_movie_clean/domain/model/user.dart';
import 'package:flutter_movie_clean/domain/usecase/signin_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginViewModel extends StateNotifier<AsyncValue<User?>> {
  LoginViewModel(this._signInUseCase) : super(const AsyncValue.data(null));
  final SignInUseCase _signInUseCase;

  void signIn(String email, String password) {
    _signInUseCase.invoke(
      SignInUseCaseInput(email: email, password: password),
      OutputObserver(
        onLoading: () => state = const AsyncValue.loading(),
        onSuccess: (data) => state = AsyncValue.data(data),
        onError: (e) => state = AsyncValue.error(e, StackTrace.current),
      ),
    );
  }
}

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, AsyncValue<User?>>((ref) {
  return LoginViewModel(ref.watch(signInUseCaseProvider));
});
