import 'package:flutter/cupertino.dart';
import '../../generated/colors.gen.dart';

class AvatarProfile extends StatelessWidget {
  final VoidCallback onTapAvatarProfile;
  final String path;
  final bool isSelected;

  AvatarProfile(this.path, this.isSelected, this.onTapAvatarProfile);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {onTapAvatarProfile()},
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: ColorName.white.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(5, 5), // Shadow position
                    )
                ],
              ),
            ),
            Image.asset(
              path,
              width: 100,
              height: 100,
            )
          ],
        ));
  }
}
