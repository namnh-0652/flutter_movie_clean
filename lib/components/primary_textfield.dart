import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class InputOptions {
  InputOptions({
    this.maxLength,
    this.cursorColor,
    this.maxLines,
    this.keyboardType,
    this.width,
    this.padding,
    this.expands,
    this.enabled,
    this.obscuringCharacter = '●',
    this.textInputAction = TextInputAction.done,
  });
  final int? maxLength;
  final Color? cursorColor;
  final int? maxLines;
  final TextInputType? keyboardType;
  final double? width;
  final EdgeInsets? padding;
  final bool? expands;
  final bool? enabled;
  final String? obscuringCharacter;
  final TextInputAction? textInputAction;
}

final class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.hintText = "",
    this.obscureText = false,
    this.backgroundColor,
    this.border,
    this.options,
    this.suffix,
    this.onChanged,
    this.validator,
  });
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final bool obscureText;
  final String? hintText;
  final Color? backgroundColor;
  final InputBorder? border;
  final InputOptions? options;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: options?.width,
      child: TextFormField(
        controller: controller,
        validator: validator,
        enabled: options?.enabled ?? true,
        style: textStyle ??
            TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
        expands: options?.expands ?? false,
        keyboardType: options?.keyboardType ?? TextInputType.text,
        maxLines: options?.maxLines,
        maxLength: options?.maxLength,
        cursorColor: options?.cursorColor,
        obscureText: obscureText,
        obscuringCharacter: options?.obscuringCharacter ?? '●',
        textAlignVertical: TextAlignVertical.center,
        textInputAction: options?.textInputAction,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: backgroundColor != null,
          isDense: true,
          contentPadding: options?.padding,
          fillColor: backgroundColor,
          border: border,
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                fontSize: 14.sp,
                color: AppColors.black50,
                fontWeight: FontWeight.w600,
              ),
          errorStyle: errorStyle ??
              TextStyle(
                fontSize: 12.sp,
                color: AppColors.crimsonApprox,
                fontWeight: FontWeight.w600,
              ),
          suffix: suffix,
        ),
      ),
    );
  }
}
