abstract class ErrorEntity implements Exception {
  ErrorEntity(this.originalException);

  final Object? originalException;
}
