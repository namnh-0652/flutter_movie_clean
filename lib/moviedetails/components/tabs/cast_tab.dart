import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_clean/generated/colors.gen.dart';
import 'package:flutter_movie_clean/moviedetails/cubit/movie_details_cubit.dart';

class CastTab extends StatefulWidget {
  const CastTab({Key? key}) : super(key: key);

  @override
  State<CastTab> createState() => _CastTabState();
}

class _CastTabState extends State<CastTab> with AutomaticKeepAliveClientMixin<CastTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final casts = context.read<MovieDetailsCubit>().state.movieDetails.casts;
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(top: 21.0),
      itemCount: casts.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              casts[index].avatar,
              width: 120.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    casts[index].name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      casts[index].participatingMovies,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.normal, color: ColorName.tundoraApprox),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
