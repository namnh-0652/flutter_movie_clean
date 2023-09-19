import 'package:domain/interactor/input/base_input.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:domain/usecase/base/base_use_case.dart';

class GetSimilarMoviesUseCase
    extends BaseUseCase<GetSimilarMoviesInput, List<Movie>> {
  GetSimilarMoviesUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<List<Movie>> buildUseCase(GetSimilarMoviesInput input) {
    return movieRepository.getSimilarMovies(input.movieId, input.language);
  }
}

class GetSimilarMoviesInput extends BaseInput {
  const GetSimilarMoviesInput(
      {required this.movieId, this.language = "en-US"});

  final int movieId;
  final String language;
}
