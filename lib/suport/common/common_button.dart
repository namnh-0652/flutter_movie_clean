import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/colors.gen.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final bool isEnable;
  final VoidCallback onPress;
  CommonButton(this.title, this.isEnable, this.onPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ScreenUtil().screenWidth - 60,
        height: 50,
        child: TextButton(
            onPressed: onPress,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    isEnable ? ColorName.crimson : ColorName.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: ColorName.crimson, width: 3)))),
            child: Text(title, style: Theme.of(context).textTheme.titleMedium)
                .tr()));
  }
}
