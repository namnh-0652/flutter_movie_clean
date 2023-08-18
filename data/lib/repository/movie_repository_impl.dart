import 'package:domain/model/movie.dart';
import 'package:domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<List<Movie>> getLatestMovies() {
    return Future.value(
        [Movie(id: 1, name: "Movie 1"), Movie(id: 2, name: "Movie 2")]);
  }
}
