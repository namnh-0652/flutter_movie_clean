import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter_movie_clean/domain/repository/movie_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

class GetLatestMoviesUseCase
    extends BaseUseCase<GetLatestMoviesInput, List<Movie>> {
  GetLatestMoviesUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<List<Movie>> buildUseCase(GetLatestMoviesInput input) {
    return movieRepository.getLatestMovies(input.language, input.page);
  }
}

class GetLatestMoviesInput extends BaseInput {
  const GetLatestMoviesInput({
    this.language = "en-US",
    this.page = 1,
  });

  final String language;
  final int page;
}
