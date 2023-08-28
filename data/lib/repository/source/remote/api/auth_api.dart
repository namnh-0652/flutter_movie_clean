import 'package:data/model/movie_data.dart';
import 'package:data/model/tv_series_data.dart';
import 'package:data/repository/source/remote/api/response/base_list_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @GET("/3/movie/now_playing")
  Future<BaseListResponse<MovieData>> getLatestMovies(
    @Query("language") String language,
    @Query("page") int page,
  );

  @GET("/3/tv/airing_today")
  Future<BaseListResponse<TvSeriesData>> getLatestSeries(
    @Query("language") String language,
    @Query("page") int page,
  );

  @GET("/3/trending/movie/day")
  Future<BaseListResponse<MovieData>> getTrendingMovies(
    @Query("language") String language,
  );
}
