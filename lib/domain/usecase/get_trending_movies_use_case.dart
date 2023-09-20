import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter_movie_clean/domain/repository/movie_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

class GetTrendingMoviesUseCase extends BaseUseCase<GetTrendingMoviesInput, List<Movie>> {
  GetTrendingMoviesUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<List<Movie>> buildUseCase(GetTrendingMoviesInput input) {
    return movieRepository.getTrendingMovies(input.language);
  }
}

class GetTrendingMoviesInput extends BaseInput {
  const GetTrendingMoviesInput({this.language = "en-US"});

  final String language;
}
