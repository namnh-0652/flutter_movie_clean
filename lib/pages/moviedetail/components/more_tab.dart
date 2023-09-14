import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/pages/moviedetail/components/tab_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key, required this.similarMovies});

  final List<Movie> similarMovies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.h),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: similarMovies.length,
        separatorBuilder: (context, index) => const Divider(color: AppColors.white50),
        itemBuilder: (context, index) {
          var currentItem = similarMovies[index];
          return TabItem(
              image: currentItem.posterPath ?? "",
              title: currentItem.title ?? "",
              content: currentItem.releaseDate ?? "");
        },
      ),
    );
  }
}
