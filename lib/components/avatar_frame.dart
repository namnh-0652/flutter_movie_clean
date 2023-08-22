import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';

class AvatarFrame extends StatelessWidget {
  const AvatarFrame({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    this.padding,
  });

  final double width;
  final double height;
  final EdgeInsets? padding;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Assets.images.avatarFrame.svg(
            width: width,
            height: height,
          ),
          image,
        ],
      ),
    );
  }
}
