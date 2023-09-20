import 'package:flutter_movie_clean/domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/components/tab_item.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/shared/utils/date_time_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
          return GestureDetector(
            onTap: () {
              context.push(MovieDetailPage.routeLocation, extra: currentItem.id);
            },
            child: TabItem(
                image: currentItem.posterPath ?? "",
                title: currentItem.title ?? "",
                content: DateTimeUtils.formatReleaseDate(currentItem.releaseDate) ?? ""),
          );
        },
      ),
    );
  }
}
