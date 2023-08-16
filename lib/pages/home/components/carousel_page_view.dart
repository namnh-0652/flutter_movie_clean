import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselPageView extends StatefulWidget {
  const CarouselPageView.builder({
    super.key,
    this.width,
    this.height,
    this.viewportFraction,
    this.initialPage,
    this.onPageChanged,
    required this.itemCount,
    required this.itemBuilder,
  });

  final double? width;
  final double? height;
  final double? viewportFraction;
  final int? initialPage;
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final ValueChanged<int>? onPageChanged;

  @override
  State<CarouselPageView> createState() => _CarouselPageViewState();
}

class _CarouselPageViewState extends State<CarouselPageView> {
  static const kDefaultViewportFraction = 0.72;
  static const kInitialPage = 1;

  late PageController _pageController;
  int _currentPage = kInitialPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: widget.viewportFraction ?? kDefaultViewportFraction,
      initialPage: widget.initialPage ?? kInitialPage,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: PageView.builder(
        itemCount: widget.itemCount,
        pageSnapping: true,
        controller: _pageController,
        onPageChanged: (index) {
          widget.onPageChanged?.call(index);
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return _buildItem(
            widget.itemBuilder(context, index),
            index == _currentPage,
          );
        },
      ),
    );
  }

  Widget _buildItem(Widget? item, bool isCurrentPage) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
            margin: EdgeInsets.symmetric(
              vertical: isCurrentPage ? 0 : 12.h,
              horizontal: isCurrentPage ? 0 : 22.w,
            ),
            child: item,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: isCurrentPage ? Colors.transparent : Colors.black54,
          ),
        ),
      ],
    );
  }
}
