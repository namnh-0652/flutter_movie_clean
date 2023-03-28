import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_clean/moviedetails/cubit/movie_details_cubit.dart';
import 'package:flutter_movie_clean/moviedetails/movie_details_view.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailsCubit(),
      child: const MovieDetailsView(),
    );
  }
}
