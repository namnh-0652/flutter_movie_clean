import 'package:flutter_movie_clean/domain/interactor/input/empty_input.dart';
import 'package:flutter_movie_clean/domain/model/account_model.dart';
import 'package:flutter_movie_clean/domain/model/profile_model.dart';
import 'package:flutter_movie_clean/domain/usecase/get_account_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_is_first_run_app_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_profile_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/logout_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/save_profile_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/update_account_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/base/base_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppViewModel extends BaseViewModel {
  AppViewModel({
    required GetIsFirstRunAppUseCase getIsFirstRunAppUseCase,
    required GetProfileUseCase getProfileUseCase,
    required SaveProfileUseCase saveProfileUseCase,
    required GetAccountUseCase getAccountUseCase,
    required UpdateAccountUseCase updateAccountUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _getIsFirstRunAppUseCase = getIsFirstRunAppUseCase,
        _getProfileUseCase = getProfileUseCase,
        _getAccountUseCase = getAccountUseCase,
        _saveProfileUseCase = saveProfileUseCase,
        _logoutUseCase = logoutUseCase,
        _updateAccountUseCase = updateAccountUseCase {
    account = _getAccountUseCase.buildUseCase(EmptyInput.instance);
    profile = _getProfileUseCase.buildUseCase(EmptyInput.instance);
  }

  final GetIsFirstRunAppUseCase _getIsFirstRunAppUseCase;
  final GetProfileUseCase _getProfileUseCase;
  final GetAccountUseCase _getAccountUseCase;
  final UpdateAccountUseCase _updateAccountUseCase;
  final SaveProfileUseCase _saveProfileUseCase;
  final LogoutUseCase _logoutUseCase;

  get isFistRunApp =>
      _getIsFirstRunAppUseCase.buildUseCase(EmptyInput.instance);

  Account? account;

  Profile? profile;

  AsyncValue<Account>? updateAccountValue;
  AsyncValue<void>? logoutState;

  setAccount(Account account) {
    this.account = account;
    notifyListeners();
  }

  updateAccount({String? password, List<Profile>? profiles}) {
    launchUseCase(
      useCase: _updateAccountUseCase,
      input: UpdateAccountInput(password: password, profiles: profiles),
      onSubscribe: () => updateAccountValue = const AsyncValue.loading(),
      onSuccess: (data) => updateAccountValue = AsyncValue.data(data),
      onError: (error) =>
          updateAccountValue = AsyncValue.error(error, StackTrace.current),
    );
  }

  setProfile({
    String? username,
    String? imagePath,
    String? password,
    String? pin,
  }) {
    profile = Profile(
      username: username ?? profile?.username,
      imagePath: imagePath ?? profile?.imagePath,
      password: password ?? profile?.password,
      pin: pin ?? profile?.pin,
    );
    notifyListeners();
  }

  setNewProfile(Profile profile) {
    account?.profiles.add(profile);
    notifyListeners();
  }

  saveProfile(Profile? profile) {
    if (profile == null) return;

    launchUseCase(
      useCase: _saveProfileUseCase,
      input: SaveProfileInput(profile),
    );
  }

  logout() {
    launchUseCase(
        useCase: _logoutUseCase,
        input: EmptyInput.instance,
        onSubscribe: () => logoutState = const AsyncValue.loading(),
        onError: (error) =>
            logoutState = AsyncValue.error(error, StackTrace.current),
        onSuccess: (data) {
          account = null;
          profile = null;
          logoutState = AsyncValue.data(data);
        });
  }
}
