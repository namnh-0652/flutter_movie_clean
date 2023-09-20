import 'package:flutter_movie_clean/data/repository/source/remote/api/response/base_error_response.dart';
import 'package:flutter_movie_clean/domain/error/error_entity.dart';

class HttpError extends ErrorEntity {
  HttpError(super.originalException, this.errorResponse);

  final BaseErrorResponse? errorResponse;
}

class NetworkError extends ErrorEntity {
  NetworkError(super.originalException);
}

class ServerError extends ErrorEntity {
  ServerError(super.originalException);
}

class UnexpectedError extends ErrorEntity {
  UnexpectedError(super.originalException);
}
