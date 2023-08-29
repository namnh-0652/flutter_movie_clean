import 'package:data/model/movie_data.dart';
import 'package:data/model/tv_series_data.dart';
import 'package:data/repository/source/remote/api/auth_api.dart';
import 'package:data/repository/source/remote/api/helper/api_ext.dart';
import 'package:data/repository/source/remote/api/response/paging_response.dart';

class MovieRemoteDataSource {
  MovieRemoteDataSource(this.authApi);

  AuthApi authApi;

  Future<List<MovieData>> getLatestMovies(String language, int page) async {
    final response = await authApi.execute(
      (api) => api.getLatestMovies(language, page),
    );
    return response.results;
  }

  Future<List<TvSeriesData>> getLatestSeries(String language, int page) async {
    final response = await authApi.execute(
      (api) => api.getLatestSeries(language, page),
    );
    return response.results;
  }

  Future<List<MovieData>> getTrendingMovies(String language) async {
    final response = await authApi.execute(
      (api) => api.getTrendingMovies(language),
    );
    return response.results;
  }

  Future<PagingResponse<MovieData>> getSortedMovies(
    String sortByValue,
    int page,
  ) async {
    return authApi.execute((api) => api.getSortedMovies(sortByValue, page));
  }

  Future<PagingResponse<TvSeriesData>> getSortedSeries(
    String sortByValue,
    int page,
  ) async {
    return authApi.execute((api) => api.getSortedSeries(sortByValue, page));
  }
}
