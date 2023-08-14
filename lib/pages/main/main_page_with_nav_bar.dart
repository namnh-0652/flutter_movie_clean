import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/pages/categories/categories_page.dart';
import 'package:flutter_movie_clean/pages/favorites/favorites_page.dart';
import 'package:flutter_movie_clean/pages/more/more_page.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../home/home_page.dart';

enum BottomTab {
  home(initialLocation: HomePage.routeLocation),
  categories(initialLocation: CategoriesPage.routeLocation),
  favorites(initialLocation: FavoritesPage.routeLocation),
  more(initialLocation: MorePage.routeLocation);

  const BottomTab({required this.initialLocation});

  final String initialLocation;
}

class MainPageWithNavBar extends StatefulWidget {
  const MainPageWithNavBar({super.key, required this.child});

  final Widget child;

  @override
  State<MainPageWithNavBar> createState() => _MainPageWithNavBareState();
}

class _MainPageWithNavBareState extends State<MainPageWithNavBar> {
  int _selectedTab = 0;

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
    context.go(BottomTab.values[index].initialLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.child,
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
        items: BottomTab.values.map((item) {
          return _buildBottomNavigationItem(
            initialLocation: item.initialLocation,
            icon: _getBottomTabIcon(item),
            label: _getBottomTabLabel(item),
          );
        }).toList(),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationItem({
    required String initialLocation,
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

  String _getBottomTabLabel(BottomTab item) {
    switch (item) {
      case BottomTab.home:
        return context.l10n.home;
      case BottomTab.categories:
        return context.l10n.categories;
      case BottomTab.favorites:
        return context.l10n.favorites;
      default:
        return context.l10n.more;
    }
  }

  SvgGenImage _getBottomTabIcon(BottomTab item) {
    switch (item) {
      case BottomTab.home:
        return Assets.images.icHome;
      case BottomTab.categories:
        return Assets.images.icCategory;
      case BottomTab.favorites:
        return Assets.images.icDownload;
      default:
        return Assets.images.icMore;
    }
  }
}
