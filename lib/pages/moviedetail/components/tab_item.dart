import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/colors.gen.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.image,
    required this.title,
    required this.content,
  });
  final String image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(image, width: 120.w, height: 150.w, fit: BoxFit.cover),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              content,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white70),
            )
          ],
        )
      ],
    );
  }
}
