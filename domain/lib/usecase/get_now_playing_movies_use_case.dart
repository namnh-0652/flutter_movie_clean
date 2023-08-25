import 'package:domain/interactor/input/base_input.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:domain/usecase/base/base_use_case.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<GetNowPlayingMoviesInput, List<Movie>> {
  GetNowPlayingMoviesUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<List<Movie>> buildUseCase(GetNowPlayingMoviesInput input) {
    return movieRepository.getNowPlayingMovies(input.language, input.page);
  }
}

class GetNowPlayingMoviesInput extends BaseInput {
  const GetNowPlayingMoviesInput({
    this.language = "en-US",
    this.page = 1,
  });

  final String language;
  final int page;
}
