import 'package:flutter_movie_clean/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_startup_state.freezed.dart';

@freezed
class AppStartupState with _$AppStartupState {
  const factory AppStartupState.initialized() = _Initialized;
  const factory AppStartupState.onboarded() = _OnBoarded;
  const factory AppStartupState.profileLoaded(User? user) = _ProfileLoaded;
}
