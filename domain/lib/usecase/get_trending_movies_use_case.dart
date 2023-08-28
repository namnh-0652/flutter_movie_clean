import 'package:domain/interactor/input/base_input.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:domain/usecase/base/base_use_case.dart';

class GetTrendingMoviesUseCase
    extends BaseUseCase<GetTrendingMoviesInput, List<Movie>> {
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
