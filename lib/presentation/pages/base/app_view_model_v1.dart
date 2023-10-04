import 'dart:async';
import 'package:flutter_movie_clean/di/use_case_provider.dart';
import 'package:flutter_movie_clean/domain/model/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_movie_clean/presentation/pages/base/app_startup_state.dart';

class AppViewModel1 extends AsyncNotifier<AppStartupState> {
  late User? currentUser;

  @override
  FutureOr<AppStartupState> build() async {
    return (await init() ?? const AppStartupState.initialized());
  }

  bool isInitialized() => state.value == const AppStartupState.initialized();
  bool isOnboarded() => state.value == const AppStartupState.onboarded();
  bool isProfileLoaded() =>
      state.value == AppStartupState.profileLoaded(currentUser);

  Future<AppStartupState?> init() async {
    currentUser = await ref.watch(getLocalUserUseCaseProvider).invoke();
    final isLoggedIn = currentUser != null;
    final isOnboarding =
        await ref.watch(hasCompletedBoadingUseCaseProvider).invoke();
    final AppStartupState newState;
    if (isLoggedIn) {
      newState = AppStartupState.profileLoaded(currentUser);
    } else if (isOnboarding) {
      newState = const AppStartupState.onboarded();
    } else {
      newState = const AppStartupState.initialized();
    }
    state = AsyncValue.data(newState);
    return state.valueOrNull;
  }

  Future<void> onboarded() async {
    await ref.read(completeBoadingUseCaseProvider).invoke();
    state = const AsyncValue.data(AppStartupState.onboarded());
  }

  Future<void> loggedIn(User? user) async {
    currentUser = user;
    state = AsyncValue.data(AppStartupState.profileLoaded(currentUser));
  }

  void loggedOut() async {
    currentUser = null;
    init();
  }
}

final appViewModel1Provider =
    AsyncNotifierProvider<AppViewModel1, AppStartupState>(AppViewModel1.new);
