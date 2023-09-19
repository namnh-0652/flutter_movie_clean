import 'package:flutter_movie_clean/domain/model/casts.dart';
import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter_movie_clean/domain/model/paging_data.dart';
import 'package:flutter_movie_clean/domain/model/tv_series.dart';

abstract class MovieRepository {
  Future<List<Movie>> getLatestMovies(String language, int page);

  Future<List<TvSeries>> getLatestSeries(String language, int page);

  Future<List<Movie>> getTrendingMovies(String language);

  Future<PagingData<Movie>> getSortedMovies(String sortBy, int page);

  Future<PagingData<TvSeries>> getSortedSeries(String sortBy, int page);

  Future<Movie> getMovieDetail(int movieId, String language);

  Future<Casts> getCasts(int movieId, String language);

  Future<List<Movie>> getSimilarMovies(int movieId, String language);
}
