import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/model/tv_series.dart';
import 'package:flutter_movie_clean/domain/repository/movie_repository.dart';
import 'package:flutter_movie_clean/domain/usecase/base/base_use_case.dart';

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
