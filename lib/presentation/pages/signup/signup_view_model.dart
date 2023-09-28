import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';
import 'package:flutter_movie_clean/domain/model/user.dart';
import 'package:flutter_movie_clean/domain/usecase/signup_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/base/loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupViewModel extends StateNotifier<AsyncValue<User?>> {
  SignupViewModel(this.ref) : super(const AsyncValue.data(null));
  final Ref ref;
  User? signupUser = User();

  void signUp() {
    ref.read(signUpUseCaseProvider).invoke(
          SignupUseCaseInput(
            email: signupUser?.email ?? "",
            password: signupUser?.password ?? "",
            avatar: signupUser?.avatar ?? "",
            nickname: signupUser?.nickname ?? "",
            pin: signupUser?.pin ?? "",
          ),
          OutputObserver(
            onLoading: () =>
                ref.read(loadingStateProvider.notifier).addProcess(),
            onFinish: () =>
                ref.read(loadingStateProvider.notifier).removeProcess(),
            onSuccess: (data) => state = AsyncValue.data(data),
            onError: (e) => state = AsyncValue.error(e, StackTrace.current),
          ),
        );
  }

  void updateUser(
      {String? email,
      String? password,
      String? avatar,
      String? nickname,
      String? pin}) {
    if (signupUser == null) {
      signupUser = User(
        email: email,
        password: password,
        avatar: avatar,
        nickname: nickname,
        pin: pin,
      );
    } else {
      signupUser = User(
        email: email ?? signupUser?.email,
        password: password ?? signupUser?.password,
        avatar: avatar ?? signupUser?.avatar,
        nickname: nickname ?? signupUser?.nickname,
        pin: pin ?? signupUser?.pin,
      );
    }
  }
}

final signUpViewModelProvider =
    StateNotifierProvider<SignupViewModel, AsyncValue<User?>>((ref) {
  return SignupViewModel(ref);
});
