import 'package:domain/interactor/input/base_input.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/tv_series.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:domain/usecase/base/base_use_case.dart';

class GetLatestSeriesUseCase
    extends BaseUseCase<GetLatestSeriesInput, List<TvSeries>> {
  GetLatestSeriesUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<List<TvSeries>> buildUseCase(GetLatestSeriesInput input) {
    return movieRepository.getLatestSeries(input.language, input.page);
  }
}

class GetLatestSeriesInput extends BaseInput {
  const GetLatestSeriesInput({
    this.language = "en-US",
    this.page = 1,
  });

  final String language;
  final int page;
}
