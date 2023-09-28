import 'package:flutter_movie_clean/data/mapper/base_mapper.dart';
import 'package:flutter_movie_clean/data/model/user_data.dart';
import 'package:flutter_movie_clean/domain/model/user.dart';

final class UserMapper extends BaseMapper<UserData, User> {
  UserMapper();

  @override
  User map(UserData data) {
    return User(data.email, data.password);
  }
}
