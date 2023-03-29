import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_clean/generated/assets.gen.dart';
import 'package:flutter_movie_clean/moviedetails/cubit/movie_details_cubit.dart';
import 'package:go_router/go_router.dart';

class TrailerTab extends StatelessWidget {
  const TrailerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.read<MovieDetailsCubit>().state.movieDetails;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: Image.asset(
            movieDetails.trailerImage,
            width: double.infinity,
            height: 233.0,
            fit: BoxFit.cover,
          ),
        ),
        Center(
            child: InkWell(
          onTap: () {
            context.goNamed('youtube_player', params: <String, String>{'id': movieDetails.trailer});
          },
          child: Image.asset(
            Assets.images.icons.icPlay.path,
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
        ))
      ],
    );
  }
}
