import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/assets.gen.dart';

class TrailerTab extends StatelessWidget {
  const TrailerTab({Key? key, required this.backdropPath}) : super(key: key);
  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285.h,
      width: 1.sw,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Image.network(
              width: 1.sw,
              height: 265.h,
              backdropPath,
              fit: BoxFit.cover,
              errorBuilder: (context, exception, stackTrace) {
                return SizedBox(height: 285.h, width: 1.sw,);
              },
            ),
          ),
          Center(
            child: Assets.images.icPlayWhite.svg(),
          )
        ],
      ),
    );
  }
}
