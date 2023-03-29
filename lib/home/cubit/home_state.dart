import '../../generated/assets.gen.dart';

class HomeState {
  HomeState();

  final List<String> moviesPaths = [
    Assets.images.movies.movies1.path,
    Assets.images.movies.movies2.path,
    Assets.images.movies.movies3.path,
  ];

  final List<String> seriesPaths = [
    Assets.images.series.series1.path,
    Assets.images.series.series2.path,
    Assets.images.series.series3.path,
  ];

  final List<String> trendingPaths = [
    Assets.images.trendings.trending1.path,
    Assets.images.trendings.trending2.path,
    Assets.images.trendings.trending3.path,
    Assets.images.trendings.trending4.path,
    Assets.images.trendings.trending1.path,
    Assets.images.trendings.trending2.path,
    Assets.images.trendings.trending3.path,
    Assets.images.trendings.trending4.path,
  ];
}
