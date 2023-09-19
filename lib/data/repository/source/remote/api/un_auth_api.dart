import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'un_auth_api.g.dart';

@RestApi()
abstract class UnAuthApi {
  factory UnAuthApi(Dio dio) = _UnAuthApi;
}
