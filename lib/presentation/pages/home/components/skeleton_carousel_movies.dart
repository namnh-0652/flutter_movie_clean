import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/presentation/components/skeleton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkeletonCarouselMovies extends StatelessWidget {
  const SkeletonCarouselMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
        child: CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 0.7,
        enlargeCenterPage: true,
        pageSnapping: true,
        enableInfiniteScroll: false,
        initialPage: 1,
        enlargeFactor: 0.25,
      ),
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 204.h,
          color: Colors.white,
        );
      },
    ));
  }
}
