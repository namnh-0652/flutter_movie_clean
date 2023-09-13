import 'package:domain/interactor/input/base_input.dart';
import 'package:domain/model/paging_data.dart';
import 'package:domain/model/tv_series.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:domain/usecase/base/base_use_case.dart';

class GetSortedSeriesUseCase
    extends BaseUseCase<GetSortedSeriesInput, PagingData<TvSeries>> {
  GetSortedSeriesUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<PagingData<TvSeries>> buildUseCase(GetSortedSeriesInput input) {
    return movieRepository.getSortedSeries(input.sortByValue, input.page);
  }
}

class GetSortedSeriesInput extends BaseInput {
  const GetSortedSeriesInput({required this.sortByValue, this.page = 1});

  final String sortByValue;
  final int page;
}
