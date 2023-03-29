import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_clean/widgets/header_widget.dart';
import 'package:go_router/go_router.dart';

import '../generated/locale_keys.g.dart';
import 'components/carousel_slider_shader.dart';
import 'components/horizontal_movie_list_view.dart';
import 'cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<HomeCubit>(context, listen: false).state;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          HeaderWidget(onProfileTapped: () {}),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 14.0),
            child: Text(
              LocaleKeys.latestMovies.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          CarouselSliderShaderWidget(
            paths: state.moviesPaths,
            onItemTapped: (int index) {
              context.go(context.namedLocation('movie_details'));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 12.0, bottom: 14.0),
            child: Text(
              LocaleKeys.latestSeries.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          CarouselSliderShaderWidget(
            paths: state.seriesPaths,
            onItemTapped: (int index) {
              context.go(context.namedLocation('movie_details'));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 12.0, bottom: 14.0),
            child: Text(
              LocaleKeys.trendingToday.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 150.0,
            child: HorizontalMoviesListView(
              paths: state.trendingPaths,
              itemWidth: 100.0,
              itemHeight: 150.0,
              onItemTapped: (int index) {
                context.go(context.namedLocation('movie_details'));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 12.0, bottom: 14.0),
            child: Text(
              LocaleKeys.oldMovies.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 150.0,
            child: HorizontalMoviesListView(
              paths: state.trendingPaths,
              itemWidth: 100.0,
              itemHeight: 150.0,
              onItemTapped: (int index) {
                context.go(context.namedLocation('movie_details'));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 12.0, bottom: 14.0),
            child: Text(
              LocaleKeys.oldSeries.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 60.0,
            child: HorizontalMoviesListView(
              paths: state.trendingPaths,
              itemWidth: 100.0,
              itemHeight: 60.0,
              onItemTapped: (int index) {
                context.go(context.namedLocation('movie_details'));
              },
            ),
          ),
          const SizedBox(height: 65.0),
        ],
      ),
    );
  }
}
