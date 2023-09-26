import 'package:flutter_movie_clean/domain/model/base_model.dart';
import 'package:flutter_movie_clean/domain/model/profile_model.dart';

class Account extends BaseModel {
  Account({
    this.email,
    this.password,
    this.profiles = const [],
  });

  final String? email;
  final String? password;
  final List<Profile> profiles;
}
