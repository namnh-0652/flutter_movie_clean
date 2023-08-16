import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/pages/categories/categories_page.dart';
import 'package:flutter_movie_clean/pages/favorites/favorites_page.dart';
import 'package:flutter_movie_clean/pages/home/home_page.dart';
import 'package:flutter_movie_clean/pages/more/more_page.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeLocation = "/";
  static const String routeName = "main";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const HomePage(),
    const CategoriesPage(),
    const FavoritesPage(),
    const MorePage(),
  ];
  final PageController controller = PageController();
  int _selectedTab = 0;

  void _changeTab(int index) {
    controller.jumpToPage(index);
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        color: AppColors.white,
        child: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.black.withOpacity(0.7),
            elevation: 0,
            currentIndex: _selectedTab,
            onTap: (index) => _changeTab(index),
            selectedItemColor: AppColors.crimsonApprox,
            unselectedItemColor: AppColors.white,
            unselectedLabelStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
            selectedLabelStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
            items: [
              _buildBottomNavigationItem(
                icon: Assets.images.icHome,
                label: context.l10n.home,
              ),
              _buildBottomNavigationItem(
                icon: Assets.images.icCategory,
                label: context.l10n.categories,
              ),
              _buildBottomNavigationItem(
                icon: Assets.images.icFavorite,
                label: context.l10n.favorites,
              ),
              _buildBottomNavigationItem(
                icon: Assets.images.icMore,
                label: context.l10n.more,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationItem({
    required SvgGenImage icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: icon.svg(width: 24.w, height: 24.h),
      activeIcon: icon.svg(
        width: 24.w,
        height: 24.h,
        colorFilter: const ColorFilter.mode(
          AppColors.crimsonApprox,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
