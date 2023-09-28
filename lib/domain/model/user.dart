import 'package:flutter_movie_clean/domain/model/base_model.dart';

class User extends BaseModel {
  final String? email;
  final String? password;
  final String? avatar;
  final String? nickname;
  final String? pin;
  // hardcode
  final String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MjdiNWFhOGE0NmFmMGE5OGUyYjM5OTIxMThmNDYzYiIsInN1YiI6IjVmOWZiZTJjZjA0ZDAxMDAzN2E0ZDc5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.m-Dda75kQLr1zEk-xDKJpRLAi1G0bXVTq8sMt1LE02c";
  User({this.email, this.password, this.avatar, this.nickname, this.pin});
}
