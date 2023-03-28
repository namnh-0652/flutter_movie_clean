import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_clean/moviedetails/cubit/movie_details_cubit.dart';

import '../generated/locale_keys.g.dart';
import 'components/download_button.dart';
import 'components/movie_details_tab_bar.dart';
import 'components/movie_poster_view.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({Key? key}) : super(key: key);

  final Gradient _maskingGradient = const LinearGradient(
    colors: [Colors.transparent, Colors.black],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<MovieDetailsCubit>(context, listen: false).state;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MoviePosterView(
                maskingGradient: _maskingGradient,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: DownloadButton(),
                    ),
                    const SizedBox(width: 48.0),
                    SizedBox(
                      width: 180.0,
                      height: 50.0,
                      child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.transparent),
                        child: Text(
                          LocaleKeys.addToWatchList.tr(),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0, bottom: 14.0),
                child: Text(
                  state.movieDetails.content,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const MovieDetailsTabBar(),
            ],
          ),
        ),
      ),
    );
  }
}
