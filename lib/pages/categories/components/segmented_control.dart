import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SegmentedControl extends StatefulWidget {
  const SegmentedControl({
    super.key,
    required this.labels,
    this.labelStyle,
    this.onSegmentChanged,
  });

  final List<String> labels;
  final TextStyle? labelStyle;
  final Function(int index)? onSegmentChanged;

  @override
  State<StatefulWidget> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: AppColors.crimsonApprox),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: widget.labels.mapIndexed((index, label) {
          return _buildSegmentItem(index, label);
        }).toList(),
      ),
    );
  }

  Widget _buildSegmentItem(int segmentIndex, String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = segmentIndex;
          });
          widget.onSegmentChanged?.call(segmentIndex);
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: _currentIndex == segmentIndex
                ? AppColors.crimsonApprox
                : Colors.transparent,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: widget.labelStyle ??
                TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
