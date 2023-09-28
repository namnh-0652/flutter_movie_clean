final class OutputObserver<Output> {
  Function()? onLoading;
  Function(Output data)? onSuccess;
  Function(Object e)? onError;
  Function()? onFinish;
  OutputObserver({this.onLoading, this.onSuccess, this.onError, this.onFinish});
}
