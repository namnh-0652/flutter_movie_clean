import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/components/skeleton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkeletonTrendingMovies extends StatelessWidget {
  const SkeletonTrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 12.w);
        },
        itemBuilder: (context, index) {
          return Container(
            width: 100.w,
            height: 150.h,
            color: Colors.white,
          );
        },
      ),
    );
  }
}
