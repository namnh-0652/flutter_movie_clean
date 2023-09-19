import 'package:flutter_movie_clean/data/repository/source/remote/api/auth_api.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/error/api_error_mapper.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/api/un_auth_api.dart';

extension AuthApiExt on AuthApi {
  Future<R> execute<R>(Future<R> Function(AuthApi api) block) async {
    try {
      return await block.call(this);
    } catch (e) {
      throw ApiErrorMapper.instance.map(e);
    }
  }
}

extension UnAuthApiExt on UnAuthApi {
  Future<R> execute<R>(Future<R> Function(UnAuthApi api) block) async {
    try {
      return await block.call(this);
    } catch (e) {
      throw ApiErrorMapper.instance.map(e);
    }
  }
}
