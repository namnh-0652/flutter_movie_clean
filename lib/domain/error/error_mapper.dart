import 'package:flutter_movie_clean/domain/error/error_entity.dart';

abstract class ErrorMapper {
  ErrorEntity map(Exception exception);
}
