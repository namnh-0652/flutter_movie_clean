import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/welcome_screen/components/welcome_foreground.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String routeLocation = "/welcome";
  static const String routeName = "welcome";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final PageController _pageController;
  late final List<AssetGenImage> welcomeImages;
  late final List<String> welcomeDescriptions = [
    context.l10n.welcomeDescription1,
    context.l10n.welcomeDescription2,
    context.l10n.welcomeDescription3,
    context.l10n.welcomeDescription4,
    context.l10n.welcomeDescription5,
    ""
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    welcomeImages = Assets.images.welcomes.values;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            onPageChanged: (index) => setCurrentIndex(index),
            controller: _pageController,
            children: welcomeImages
                .map(
                  (e) => Column(
                    children: [
                      Image.asset(e.path, fit: BoxFit.fitWidth),
                      Expanded(child: Container(color: Colors.black))
                    ],
                  ),
                )
                .toList(),
          ),
          WelcomeForeground(
            pageController: _pageController,
            description: welcomeDescriptions[_currentIndex],
            isLastItem: _currentIndex == welcomeDescriptions.length - 1,
            pageCount: welcomeDescriptions.length,
          )
        ],
      ),
    );
  }

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index % welcomeImages.length;
    });
  }
}
