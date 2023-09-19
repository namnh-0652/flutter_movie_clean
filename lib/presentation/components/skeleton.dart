import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect.raw(
        colors: [
          AppColors.mineShaft,
          AppColors.lightMineShaft,
          AppColors.tundora,
          AppColors.lightMineShaft,
          AppColors.mineShaft,
          AppColors.mineShaft,
        ],
        stops: [0, 0.1, 0.2, 0.3, 0.5, 1],
        duration: Duration(milliseconds: 1500),
      ),
      child: child,
    );
  }
}
