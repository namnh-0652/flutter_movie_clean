import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/pages/moviedetail/components/tab_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key, required this.recommendMovies});

  final List<Movie> recommendMovies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.h),
      child: SizedBox(
        width: 1.sw,
        height: (162.w * recommendMovies.length) - 12.h,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recommendMovies.length,
          separatorBuilder: (context, index) => const Divider(color: AppColors.white50),
          itemBuilder: (context, index) {
            var currentItem = recommendMovies[index];
            return TabItem(
                image: currentItem.posterPath ?? "",
                title: currentItem.title ?? "",
                content: currentItem.releaseDate ?? "");
          },
        ),
      ),
    );
  }
}
