import 'package:flutter_movie_clean/data/mapper/casts_maper.dart';
import 'package:flutter_movie_clean/data/mapper/movie_mapper.dart';
import 'package:flutter_movie_clean/data/mapper/tv_series_mapper.dart';
import 'package:flutter_movie_clean/data/repository/source/remote/movie_remote_data_source.dart';
import 'package:flutter_movie_clean/domain/model/casts.dart';
import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter_movie_clean/domain/model/paging_data.dart';
import 'package:flutter_movie_clean/domain/model/tv_series.dart';
import 'package:flutter_movie_clean/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl(
    this.movieRemoteDataSource,
    this.movieMapper,
    this.tvSeriesMapper,
    this.castsMapper,
  );

  final MovieRemoteDataSource movieRemoteDataSource;
  final MovieMapper movieMapper;
  final TvSeriesMapper tvSeriesMapper;
  final CastsMapper castsMapper;

  @override
  Future<List<Movie>> getLatestMovies(String language, int page) async {
    final movies = await movieRemoteDataSource.getLatestMovies(language, page);
    return movieMapper.mapList(movies);
  }

  @override
  Future<List<TvSeries>> getLatestSeries(String language, int page) async {
    final movies = await movieRemoteDataSource.getLatestSeries(language, page);
    return tvSeriesMapper.mapList(movies);
  }

  @override
  Future<List<Movie>> getTrendingMovies(String language) async {
    final movies = await movieRemoteDataSource.getTrendingMovies(language);
    return movieMapper.mapList(movies);
  }

  @override
  Future<PagingData<Movie>> getSortedMovies(
    String sortBy,
    int page,
  ) async {
    final response = await movieRemoteDataSource.getSortedMovies(sortBy, page);
    return PagingData(
      response.page,
      response.totalPages,
      movieMapper.mapList(response.results),
    );
  }

  @override
  Future<PagingData<TvSeries>> getSortedSeries(
    String sortBy,
    int page,
  ) async {
    final response = await movieRemoteDataSource.getSortedSeries(sortBy, page);
    return PagingData(
      response.page,
      response.totalPages,
      tvSeriesMapper.mapList(response.results),
    );
  }

  @override
  Future<Movie> getMovieDetail(int movieId, String language) async {
    final movie = await movieRemoteDataSource.getMovieDetail(movieId, language);
    return movieMapper.map(movie);
  }

  @override
  Future<Casts> getCasts(int movieId, String language) async {
    final casts = await movieRemoteDataSource.getCasts(movieId, language);
    return castsMapper.map(casts);
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId, String language) async {
    final movies = await movieRemoteDataSource.getSimilarMovies(movieId, language);
    return movieMapper.mapList(movies);
  }
}
