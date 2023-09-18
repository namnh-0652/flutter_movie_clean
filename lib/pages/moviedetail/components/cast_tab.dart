import 'package:domain/model/cast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/pages/moviedetail/components/tab_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastTab extends StatelessWidget {
  const CastTab({super.key, required this.casts});

  final List<Cast> casts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 16.h, right: 16.h, bottom: 20.h),
      child: ListView.separated(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: casts.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 12.h,
            );
          },
          itemBuilder: (context, index) {
            var currentItem = casts[index];
            return TabItem(
              title: currentItem.name ?? "",
              image: currentItem.profilePath ?? "",
              content: currentItem.character ?? "",
            );
          }),
    );
  }
}
