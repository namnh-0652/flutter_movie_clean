import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/pages/welcome_screen/components/welcome_foreground.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String routeLocation = "/welcome";
  static const String routeName = "welcome";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final PageController _pageController;
  late final List<AssetGenImage> imageWelcomes;
  int _currentIndex = 0;
  late final List<String> titleWelcomes = [
    context.l10n.welcomeDescription1,
    context.l10n.welcomeDescription2,
    context.l10n.welcomeDescription3,
    context.l10n.welcomeDescription4,
    context.l10n.welcomeDescription5,
    ""
  ];
  @override
  void initState() {
    _pageController = PageController();
    imageWelcomes = Assets.images.welcomes.values;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: 360.w,
                height: 1.sh,
                child: PageView(
                    onPageChanged: (index) => setCurrentIndex(index),
                    controller: _pageController,
                    children: imageWelcomes
                        .map((e) => Column(
                              children: [
                                e.image(
                                    fit: BoxFit.fill,
                                    width: 360.w,
                                    height: 600.h),
                                const Spacer()
                              ],
                            ))
                        .toList()),
              ),
            ],
          ),
          SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: WelcomeForeground(
                pageController: _pageController,
                description: titleWelcomes[_currentIndex],
                isLastItem: _currentIndex == titleWelcomes.length - 1,
                pageCount: titleWelcomes.length,
                btnContinueClicked: () {
                  setCurrentIndex(_currentIndex + 1);
                  goToPage(_currentIndex);
                },
              ))
        ],
      ),
    );
  }

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index % imageWelcomes.length;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void goToPage(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}
