import 'package:domain/model/movie.dart';
import 'package:domain/model/paging_data.dart';
import 'package:domain/model/tv_series.dart';

abstract class MovieRepository {
  Future<List<Movie>> getLatestMovies(String language, int page);

  Future<List<TvSeries>> getLatestSeries(String language, int page);

  Future<List<Movie>> getTrendingMovies(String language);

  Future<PagingData<Movie>> getSortedMovies(String sortBy, int page);

  Future<PagingData<TvSeries>> getSortedSeries(String sortBy, int page);
}
