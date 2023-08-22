import 'package:data/model/movie_data.dart';
import 'package:data/repository/source/remote/api/response/base_list_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @GET("/3/movie/now_playing")
  Future<BaseListResponse<MovieData>> getNowPlayingMovies(
    @Query("language") String language,
    @Query("page") int page,
  );
}
