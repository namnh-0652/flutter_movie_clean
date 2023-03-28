import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_clean/moviedetails/cubit/movie_details_cubit.dart';

import '../../generated/assets.gen.dart';

class MoviePosterView extends StatelessWidget {
  const MoviePosterView({super.key, required Gradient maskingGradient})
      : _maskingGradient = maskingGradient;

  final Gradient _maskingGradient;

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.read<MovieDetailsCubit>().state.movieDetails;
    return SizedBox(
      height: 476.0,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
            blendMode: BlendMode.darken,
            child: Image.asset(
              movieDetails.poster,
              fit: BoxFit.fill,
              width: double.infinity,
              height: 476.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 16.0),
            child: InkWell(
              child: Image.asset(
                Assets.images.icons.icBack.path,
                fit: BoxFit.fill,
                width: 31.0,
                height: 24.0,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 223.0,
              height: 48.0,
              margin: const EdgeInsets.only(top: 56.0),
              child: Text(
                movieDetails.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  Assets.images.icons.icPlay.path,
                  fit: BoxFit.cover,
                  width: 80.0,
                  height: 80.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
