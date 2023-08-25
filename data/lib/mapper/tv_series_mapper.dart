import 'package:data/mapper/base_mapper.dart';
import 'package:data/model/tv_series_data.dart';
import 'package:domain/model/tv_series.dart';

class TvSeriesMapper extends BaseMapper<TvSeriesData, TvSeries> {
  TvSeriesMapper(this.baseImageUrl);

  final String baseImageUrl;

  @override
  TvSeries map(TvSeriesData data) {
    return TvSeries(
      id: data.id,
      posterPath: "$baseImageUrl${data.posterPath ?? ""}",
      backdropPath: "$baseImageUrl${data.backdropPath ?? ""}",
      originalName: data.originalName,
      originalLanguage: data.originalLanguage,
      name: data.name,
      overview: data.overview,
      genreIds: data.genreIds,
      originCountries: data.originCountries,
      firstAirDate: data.firstAirDate,
      voteAverage: data.voteAverage,
      voteCount: data.voteCount,
      popularity: data.popularity,
    );
  }
}
