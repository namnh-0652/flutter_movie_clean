import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../generated/assets.gen.dart';
import '../generated/colors.gen.dart';
import '../generated/locale_keys.g.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: child,
      backgroundColor: Colors.black,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(Assets.images.icons.icHome.path),
                activeIcon:
                    Image.asset(Assets.images.icons.icHome.path, color: ColorName.crimsonApprox),
                label: LocaleKeys.home.tr(),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(Assets.images.icons.icCategories.path),
                activeIcon: Image.asset(Assets.images.icons.icCategories.path,
                    color: ColorName.crimsonApprox),
                label: LocaleKeys.categories.tr(),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(Assets.images.icons.icDownloads.path),
                activeIcon: Image.asset(Assets.images.icons.icDownloads.path,
                    color: ColorName.crimsonApprox),
                label: LocaleKeys.downloads.tr(),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(Assets.images.icons.icMore.path),
                activeIcon:
                    Image.asset(Assets.images.icons.icMore.path, color: ColorName.crimsonApprox),
                label: LocaleKeys.more.tr(),
              )
            ],
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            selectedItemColor: ColorName.crimsonApprox,
            backgroundColor: Colors.black.withOpacity(0.7),
            currentIndex: _calculateSelectedIndex(context),
            onTap: (int index) => _onItemTapped(index, context),
          ),
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/categories')) {
      return 1;
    }
    if (location.startsWith('/downloads')) {
      return 2;
    }
    if (location.startsWith('/more')) {
      return 3;
    }
    return 0;
  }

  _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/categories');
        break;
      case 2:
        GoRouter.of(context).go('/downloads');
        break;
      case 3:
        GoRouter.of(context).go('/more');
        break;
    }
  }
}
