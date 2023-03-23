import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../generated/assets.gen.dart';
import '../../generated/colors.gen.dart';
import '../../generated/locale_keys.g.dart';

class OnBoardingItemPage extends StatelessWidget {
  const OnBoardingItemPage({
    super.key,
    required PageController controller,
    required String title,
    required this.context,
  })  : _controller = controller,
        _title = title;

  final PageController _controller;
  final String _title;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
          const SizedBox(height: 60.0),
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
          const SizedBox(height: 40.0),
          IgnorePointer(
            ignoring: true,
            child: SizedBox(
              height: 115.0,
              child: Text(
                _title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 53.0),
          Padding(
            padding: const EdgeInsets.only(
              left: 50.0,
              right: 50.0,
            ),
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
                onPressed: () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn,
                  );
                },
                child: Text(
                  LocaleKeys.continue_on_boarding.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
