import 'package:flutter/material.dart';

import '../generated/assets.gen.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.onProfileTapped}) : super(key: key);

  final Function() onProfileTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              Assets.images.marvelLogo.path,
              width: 100.0,
              height: 45.26,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(Assets.images.bgProfile.path),
                  child: CircleAvatar(
                    radius: 27.0,
                    backgroundImage: AssetImage(Assets.images.profileAvatar.path),
                  ),
                ),
                onTap: () {
                  onProfileTapped();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
