import 'package:flutter_movie_clean/domain/model/base_model.dart';

class Profile extends BaseModel {
  Profile({
    this.username,
    this.imagePath,
    this.password,
    this.pin,
  });

  final String? username;
  final String? imagePath;
  final String? password;
  final String? pin;
}
