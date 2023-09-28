import 'package:flutter_movie_clean/domain/model/user.dart';
import 'package:flutter_movie_clean/domain/usecase/complete_boading_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_movie_clean/domain/usecase/get_local_user_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/has_completed_boading_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/base/app_startup_state.dart';

class AppViewModel extends StateNotifier<AppStartupState> {
  final GetLocalUserUseCase _getLocalUserUseCase;
  final HasCompletedBoadingUseCase _hasCompletedBoadingUseCase;
  final CompleteBoadingUseCase _completeBoadingUseCase;
  late User? currentUser;

  AppViewModel(this._getLocalUserUseCase, this._hasCompletedBoadingUseCase,
      this._completeBoadingUseCase)
      : super(const AppStartupState.initialized());

  bool isInitialized() => state == const AppStartupState.initialized();
  bool isOnboarded() => state == const AppStartupState.onboarded();
  bool isProfileLoaded() => state == AppStartupState.profileLoaded(currentUser);

  void init() async {
    currentUser = await _getLocalUserUseCase.invoke();
    final isLoggedIn = currentUser != null;
    final isOnboarding = await _hasCompletedBoadingUseCase.invoke();
    if (isLoggedIn) {
      state = AppStartupState.profileLoaded(currentUser);
    } else if (isOnboarding) {
      state = const AppStartupState.onboarded();
    } else {
      state = const AppStartupState.initialized();
    }
  }

  Future<void> onboarded() async {
    await _completeBoadingUseCase.invoke();
    state = const AppStartupState.onboarded();
  }

  Future<void> loggedIn(User user) async {
    currentUser = user;
    state = AppStartupState.profileLoaded(currentUser);
  }

  void loggedOut() async {
    currentUser = null;
    init();
  }
}
