import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter_movie_clean/domain/model/paging_data.dart';
import 'package:flutter_movie_clean/domain/repository/movie_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

class GetSortedMoviesUseCase extends BaseUseCase<GetSortedMoviesInput, PagingData<Movie>> {
  GetSortedMoviesUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<PagingData<Movie>> buildUseCase(GetSortedMoviesInput input) {
    return movieRepository.getSortedMovies(input.sortBy, input.page);
  }
}

class GetSortedMoviesInput extends BaseInput {
  const GetSortedMoviesInput({required this.sortBy, this.page = 1});

  final String sortBy;
  final int page;
}
