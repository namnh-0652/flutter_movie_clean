import 'package:data/model/movie_data.dart';
import 'package:data/repository/source/remote/api/auth_api.dart';
import 'package:data/repository/source/remote/api/helper/api_ext.dart';

class MovieRemoteDataSource {
  MovieRemoteDataSource(this.authApi);

  AuthApi authApi;

  Future<List<MovieData>> getNowPlayingMovies(String language, int page) async {
    final response = await authApi.execute(
      (api) => api.getNowPlayingMovies(language, page),
    );
    return response.results;
  }
}
