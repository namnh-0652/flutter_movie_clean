import 'package:domain/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlayingMovies(String language, int page);
}
