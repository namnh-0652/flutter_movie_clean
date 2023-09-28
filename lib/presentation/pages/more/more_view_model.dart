import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';
import 'package:flutter_movie_clean/domain/usecase/signout_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoreViewModel extends StateNotifier<AsyncValue<dynamic>> {
  MoreViewModel(this._signOutUseCase) : super(const AsyncValue.data(null));
  final SignOutUseCase _signOutUseCase;

  void signOut() async {
    _signOutUseCase.invoke(OutputObserver(
      onLoading: () => state = const AsyncValue.loading(),
      onFinish: () => state = const AsyncValue.data(null), //
    ));
  }
}

final moreViewModelProvider = StateNotifierProvider.autoDispose((ref) {
  return MoreViewModel(ref.read(signOutUseCaseProvider));
});
