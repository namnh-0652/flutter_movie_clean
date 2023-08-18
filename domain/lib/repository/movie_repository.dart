import 'package:domain/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getLatestMovies();
}
