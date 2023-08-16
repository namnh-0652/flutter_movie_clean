import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    this.width,
    this.height,
    this.title,
    this.onPressed,
    this.textStyle,
    this.borderSide,
    this.backgroundColor,
    super.key,
  });

  final Function()? onPressed;
  final String? title;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.transparent,
          side: borderSide ??
              BorderSide(color: AppColors.crimsonApprox, width: 3.w)),
      child: SizedBox(
        width: width ?? 1.sw,
        height: height ?? 50.h,
        child: Center(
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
      ),
    );
  }
}
