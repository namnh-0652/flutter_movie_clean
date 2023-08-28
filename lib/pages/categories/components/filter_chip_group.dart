import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class FilterChipGroups extends StatefulWidget {
  const FilterChipGroups({
    super.key,
    required this.labels,
    this.onChipSelected,
  });

  final List<String> labels;
  final Function(int index)? onChipSelected;

  @override
  State<StatefulWidget> createState() => _FilterChipGroupsState();
}

class _FilterChipGroupsState extends State<FilterChipGroups> {
  final itemScrollController = ItemScrollController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      child: ScrollablePositionedList.separated(
        itemScrollController: itemScrollController,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        scrollDirection: Axis.horizontal,
        itemCount: widget.labels.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 8.w);
        },
        itemBuilder: (context, index) {
          return _buildChipItem(index, widget.labels[index]);
        },
      ),
    );
  }

  Widget _buildChipItem(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        itemScrollController.scrollTo(
          index: index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          alignment: 0.5,
        );
        widget.onChipSelected?.call(index);
      },
      child: AnimatedContainer(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 1.h),
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.r)),
          border: Border.all(width: 1.w, color: AppColors.white),
          color: _currentIndex == index ? AppColors.white : AppColors.black,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.sp,
            color: _currentIndex == index ? AppColors.black : AppColors.white,
          ),
        ),
      ),
    );
  }
}
