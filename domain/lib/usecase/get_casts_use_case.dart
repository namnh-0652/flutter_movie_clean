import 'package:domain/interactor/input/base_input.dart';
import 'package:domain/model/casts.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:domain/usecase/base/base_use_case.dart';

class GetCastsUseCase
    extends BaseUseCase<GetCastsInput, Casts> {
  GetCastsUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<Casts> buildUseCase(GetCastsInput input) {
    return movieRepository.getCasts(input.movieId, input.language);
  }
}

class GetCastsInput extends BaseInput {
  const GetCastsInput({
    this.language = "en-US",
    required this.movieId
  });

  final String language;
  final int movieId;
}
