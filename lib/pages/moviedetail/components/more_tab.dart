import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/pages/moviedetail/components/tab_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key, required this.recommendMovies});

  final List<Movie> recommendMovies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      itemCount: recommendMovies.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        var currentItem = recommendMovies[index];
        return TabItem(
            image: currentItem.posterPath ?? "",
            title: currentItem.title ?? "",
            content: currentItem.releaseDate ?? "");
      },
    );
  }
}
