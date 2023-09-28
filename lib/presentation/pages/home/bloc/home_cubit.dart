import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_movies_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_latest_series_use_case.dart';
import 'package:flutter_movie_clean/domain/usecase/get_trending_movies_use_case.dart';
import 'package:flutter_movie_clean/presentation/pages/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getLatestMoviesUseCase,
    this._getLatestSeriesUseCase,
    this._getTrendingMoviesUseCase,
  ) : super(const HomeState());

  final GetLatestMoviesUseCase _getLatestMoviesUseCase;
  final GetLatestSeriesUseCase _getLatestSeriesUseCase;
  final GetTrendingMoviesUseCase _getTrendingMoviesUseCase;

  void getLatestMovies() async {
    await _getLatestMoviesUseCase.call(
      const GetLatestMoviesInput(),
      OutputObserver()
        ..onSubscribe(() {
          // emit(state.copyWith(trendingMovies: result));
        })
        ..onSuccess((data) {
          emit(state.copyWith(trendingMovies: data));
        })
        ..onError((p0) {
          print("abc");
        }),
    );
  }

  void getLatestSeries() {
    _getLatestSeriesUseCase.call(
      const GetLatestSeriesInput(),
      OutputObserver()
        ..onSubscribe(() {})
        ..onSuccess((data) {})
        ..onError((error) {}),
    );
  }

  void getTrendingMovies() {
    _getTrendingMoviesUseCase.call(
      const GetTrendingMoviesInput(),
      OutputObserver()
        ..onSubscribe(() {})
        ..onSuccess((data) {})
        ..onError((error) {}),
    );
  }
}
