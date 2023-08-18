import 'package:domain/interactor/input/base_input.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:domain/usecase/base/base_use_case.dart';

class GetLatestMoviesUseCase
    extends BaseUseCase<GetLatestMoviesInput, List<Movie>> {
  GetLatestMoviesUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<List<Movie>> buildUseCase(GetLatestMoviesInput input) {
    return movieRepository.getLatestMovies();
  }
}

class GetLatestMoviesInput extends BaseInput {
  const GetLatestMoviesInput(this.type);

  final String type;
}
