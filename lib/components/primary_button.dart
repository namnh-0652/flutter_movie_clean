import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    this.width,
    this.height,
    this.onPressed,
    this.title,
    this.textStyle,
    this.backgroundColor,
    super.key,
  });

  final double? width;
  final double? height;
  final Function()? onPressed;
  final String? title;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor ?? AppColors.crimsonApprox,
      height: height ?? 50.h,
      onPressed: onPressed,
      child: SizedBox(
        width: width ?? 1.sw,
        child: Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: textStyle ??
              TextStyle(
                fontSize: 18.38.sp,
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
