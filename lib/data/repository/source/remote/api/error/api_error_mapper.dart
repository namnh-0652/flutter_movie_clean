import 'package:flutter_movie_clean/data/repository/source/remote/api/error/api_error.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/response/base_error_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_clean/domain/error/error_entity.dart';
import 'package:flutter_movie_clean/domain/error/error_mapper.dart';

class ApiErrorMapper extends ErrorMapper {
  ApiErrorMapper._();

  static final ApiErrorMapper instance = ApiErrorMapper._();

  @override
  ErrorEntity map(Object? exception) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionError:
          return NetworkError(exception);
        case DioExceptionType.badResponse:
          if ((exception.response?.statusCode ?? 0) >= 500) {
            return ServerError(exception);
          }
          return HttpError(
            exception,
            BaseErrorResponse.fromJson(exception.response?.data),
          );
        case DioExceptionType.unknown:
        default:
          return UnexpectedError(exception);
      }
    }
    return UnexpectedError(exception);
  }
}
