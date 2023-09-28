import 'package:hooks_riverpod/hooks_riverpod.dart';

final class LoadingState extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  int processes = 0;

  void addProcess() {
    processes++;
    state = processes > 0;
  }

  void removeProcess() {
    processes--;
    state = processes > 0;
  }
}

final loadingStateProvider = NotifierProvider<LoadingState, bool>(() {
  return LoadingState();
});
