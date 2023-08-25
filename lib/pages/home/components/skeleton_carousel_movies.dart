import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/components/skeleton.dart';
import 'package:flutter_movie_clean/pages/home/components/carousel_page_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkeletonCarouselMovies extends StatelessWidget {
  const SkeletonCarouselMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: CarouselPageView.builder(
        height: 204.h,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 204.h,
            color: Colors.white,
          );
        },
      ),
    );
  }
}
