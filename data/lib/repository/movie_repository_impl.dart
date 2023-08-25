import 'package:data/mapper/movie_mapper.dart';
import 'package:data/repository/source/remote/movie_remote_data_source.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl(
    this.movieRemoteDataSource,
    this.movieMapper,
  );

  final MovieRemoteDataSource movieRemoteDataSource;
  final MovieMapper movieMapper;

  @override
  Future<List<Movie>> getNowPlayingMovies(String language, int page) async {
    final movies =
        await movieRemoteDataSource.getNowPlayingMovies(language, page);
    return movieMapper.mapList(movies);
  }
}
