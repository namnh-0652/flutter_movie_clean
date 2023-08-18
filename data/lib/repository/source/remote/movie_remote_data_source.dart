import 'package:data/model/movie_data.dart';
import 'package:data/repository/source/remote/api/auth_api.dart';

class MovieRemoteDataSource {
  const MovieRemoteDataSource({required this.authApi});

  final AuthApi authApi;

  Future<List<MovieData>> getLatestMovies() async {
    final response = await authApi.getLatestMovies("abc");
    return response.data ?? [];
  }
}
