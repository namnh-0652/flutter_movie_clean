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
    return SizedBox(
      width: 1.sh,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
          physics: const NeverScrollableScrollPhysics(),
          clipBehavior: Clip.none,
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
              image: currentItem.image ?? "",
              content: currentItem.role ?? "",
            );
          }),
    );
  }
}
