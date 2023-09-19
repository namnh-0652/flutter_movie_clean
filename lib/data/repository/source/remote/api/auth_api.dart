import 'package:flutter_movie_clean/data/model/casts_data.dart';
import 'package:flutter_movie_clean/data/model/movie_data.dart';
import 'package:flutter_movie_clean/data/model/tv_series_data.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/response/paging_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @GET("/3/movie/now_playing")
  Future<PagingResponse<MovieData>> getLatestMovies(
    @Query("language") String language,
    @Query("page") int page,
  );

  @GET("/3/tv/airing_today")
  Future<PagingResponse<TvSeriesData>> getLatestSeries(
    @Query("language") String language,
    @Query("page") int page,
  );

  @GET("/3/trending/movie/day")
  Future<PagingResponse<MovieData>> getTrendingMovies(
    @Query("language") String language,
  );

  @GET("/3/discover/movie")
  Future<PagingResponse<MovieData>> getSortedMovies(
    @Query("sort_by") String sortBy,
    @Query("page") int page, {
    @Query("include_adult") bool includeAdult = false,
    @Query("include_video") bool includeVideo = false,
    @Query("language") String language = "en-US",
  });

  @GET("/3/discover/tv")
  Future<PagingResponse<TvSeriesData>> getSortedSeries(
    @Query("sort_by") String sortBy,
    @Query("page") int page, {
    @Query("include_adult") bool includeAdult = false,
    @Query("include_video") bool includeVideo = false,
    @Query("language") String language = "en-US",
  });

  @GET("/3/movie/{movie_id}")
  Future<MovieData> getMovieDetail(
    @Path("movie_id") int movieId,
    @Query("language") String language,
  );

  @GET("/3/movie/{movie_id}/credits")
  Future<CastsData> getCasts(
    @Path("movie_id") int movieId,
    @Query("language") String language,
  );

  @GET("/3/movie/{movie_id}/similar")
  Future<PagingResponse<MovieData>> getSimilarMovies(
      @Path("movie_id") int movieId, @Query("language") String language);
}
