import 'package:flutter_movie_clean/data/model/casts_data.dart';
import 'package:flutter_movie_clean/data/model/movie_data.dart';
import 'package:flutter_movie_clean/data/model/tv_series_data.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/auth_api.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/helper/api_ext.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/response/paging_response.dart';

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
    String sortBy,
    int page,
  ) async {
    return authApi.execute((api) => api.getSortedMovies(sortBy, page));
  }

  Future<PagingResponse<TvSeriesData>> getSortedSeries(
    String sortBy,
    int page,
  ) async {
    return authApi.execute((api) => api.getSortedSeries(sortBy, page));
  }

  Future<MovieData> getMovieDetail(int movieId, String language) async {
    return await authApi
        .execute((api) => api.getMovieDetail(movieId, language));
  }

  Future<CastsData> getCasts(int movieId, String language) async {
    return await authApi.execute((api) => api.getCasts(movieId, language));
  }

  Future<List<MovieData>> getSimilarMovies(int movieId, String language) async {
    final response = await authApi.execute(
      (api) => api.getSimilarMovies(movieId, language),
    );
    return response.results;
  }
}
