import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        _buildTextContent()
      ],
    );
  }

  Widget _buildTextContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.h,
          ),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: AppColors.white),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: AppColors.white70),
          )
        ],
      ),
    );
  }
}
