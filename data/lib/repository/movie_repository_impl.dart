import 'package:data/mapper/movie_mapper.dart';
import 'package:data/mapper/tv_series_mapper.dart';
import 'package:data/repository/source/remote/movie_remote_data_source.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/tv_series.dart';
import 'package:domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl(
    this.movieRemoteDataSource,
    this.movieMapper,
    this.tvSeriesMapper,
  );

  final MovieRemoteDataSource movieRemoteDataSource;
  final MovieMapper movieMapper;
  final TvSeriesMapper tvSeriesMapper;

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
    final movies =
        await movieRemoteDataSource.getTrendingMovies(language);
    return movieMapper.mapList(movies);
  }
}
