import 'package:domain/error/error_entity.dart';

abstract class ErrorMapper {
  ErrorEntity map(Exception exception);
}
