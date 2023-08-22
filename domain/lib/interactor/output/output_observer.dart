class OutputObserver<Output> {
  Function()? _onSubscribe;
  Function(Output)? _onSuccess;
  Function(Exception)? _onError;

  void onSubscribe(Function() block) {
    _onSubscribe = block;
  }

  void onSuccess(Function(Output) block) {
    _onSuccess = block;
  }

  void onError(Function(Exception)? block) {
    _onError = block;
  }

  void callSubscribe() => _onSubscribe?.call();

  void callSuccess(Output output) => _onSuccess?.call(output);

  void callError(Exception error) => _onError?.call(error);
}
