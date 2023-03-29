import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_clean/generated/colors.gen.dart';
import 'package:flutter_movie_clean/moviedetails/cubit/movie_details_cubit.dart';

class MoreTab extends StatefulWidget {
  const MoreTab({Key? key}) : super(key: key);

  @override
  State<MoreTab> createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> with AutomaticKeepAliveClientMixin<MoreTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mores = context.read<MovieDetailsCubit>().state.movieDetails.mores;
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(top: 20.0),
      itemCount: mores.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              mores[index].poster,
              width: 110.0,
              height: 170.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 129.0,
                    height: 48.0,
                    child: Text(
                      mores[index].name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      mores[index].releaseYear,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: ColorName.graySolid, fontWeight: FontWeight.bold),
                    ),
                  )
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
