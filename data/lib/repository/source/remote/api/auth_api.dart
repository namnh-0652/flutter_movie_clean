import 'package:data/model/movie_data.dart';
import 'package:dio/dio.dart';

class AuthApi {
  const AuthApi(this._dio);

  final Dio _dio;

  Future<Response<List<MovieData>>> getLatestMovies(String type) {
    return _dio.get(
      '/movies/latest',
      queryParameters: {'id': 12, 'name': 'dio'},
    );
  }
}
