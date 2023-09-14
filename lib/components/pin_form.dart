import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PinForm extends StatefulWidget {
  const PinForm({this.pinData = const [], this.onPinChange, super.key});

  final List<String> pinData;
  final Function(String)? onPinChange;
  @override
  State<PinForm> createState() => _PinFormState();
}

class _PinFormState extends State<PinForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.pinData
            .mapIndexed((index, element) => _buildPinInput(index))
            .toList(),
      ),
    );
  }

  SizedBox _buildPinInput(int index) {
    return SizedBox(
      width: 40.w,
      height: 50.w,
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.isEmpty && widget.pinData[index].isNotEmpty && index != 0) {
            FocusScope.of(context).previousFocus();
          }
          if (value.length == 1 && index != 3) {
            FocusScope.of(context).nextFocus();
          }
          widget.pinData[index] = value;
          widget.onPinChange?.call(widget.pinData.join(""));
        },
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            color: AppColors.white,
            fontSize: 18.38.sp,
            fontWeight: FontWeight.w600),
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: AppColors.white.withOpacity(0.2),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.w),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
