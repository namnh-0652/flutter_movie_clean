import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter_movie_clean/domain/repository/movie_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

class GetMovieDetailUseCase extends BaseUseCase<GetMovieDetailInput, Movie> {
  GetMovieDetailUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<Movie> buildUseCase(GetMovieDetailInput input) {
    return movieRepository.getMovieDetail(input.movieId, input.language);
  }
}

class GetMovieDetailInput extends BaseInput {
  const GetMovieDetailInput({
    required this.movieId,
    this.language = "en-US",
  });

  final int movieId;
  final String language;
}
