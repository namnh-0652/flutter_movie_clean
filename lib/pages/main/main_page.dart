import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/pages/categories/categories_page.dart';
import 'package:flutter_movie_clean/pages/favorites/favorites_page.dart';
import 'package:flutter_movie_clean/pages/more/more_page.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const String routeLocation = "/";
  static const String routeName = "main";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController controller = PageController();
  final List<Widget> _pages = [
    const HomePage(),
    const CategoriesPage(),
    const FavoritesPage(),
    const MorePage(),
  ];
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
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.black,
        elevation: 0,
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: AppColors.crimson,
        unselectedItemColor: AppColors.white,
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
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
            icon: Assets.images.icDownload,
            label: context.l10n.favorites,
          ),
          _buildBottomNavigationItem(
            icon: Assets.images.icMore,
            label: context.l10n.more,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationItem({
    required SvgGenImage icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: icon.svg(width: 24, height: 24),
      activeIcon: icon.svg(
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          AppColors.crimson,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
