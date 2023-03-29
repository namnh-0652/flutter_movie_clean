import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../generated/assets.gen.dart';
import '../../generated/colors.gen.dart';
import '../../generated/locale_keys.g.dart';

class OnBoardingEndPage extends StatelessWidget {
  const OnBoardingEndPage({
    super.key,
    required PageController controller,
    required this.context,
  }) : _controller = controller;

  final PageController _controller;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 132.0,
          ),
          IgnorePointer(
            ignoring: true,
            child: Image.asset(
              Assets.images.marvelLogo.path,
              width: 185.0,
              height: 75.0,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          IgnorePointer(
            ignoring: true,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 6,
              effect: const WormEffect(
                activeDotColor: ColorName.crimsonApprox,
                dotColor: Colors.white,
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 10.0,
              ),
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorName.crimsonApprox,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  LocaleKeys.signup.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(
                    width: 3.0,
                    color: ColorName.crimsonApprox,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                onPressed: () {
                  context.go(context.namedLocation('home'));
                },
                child: Text(
                  LocaleKeys.login.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
