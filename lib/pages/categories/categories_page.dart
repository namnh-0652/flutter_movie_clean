import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/pages/categories/components/filter_chip_group.dart';
import 'package:flutter_movie_clean/pages/categories/components/segmented_control.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<StatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with AutomaticKeepAliveClientMixin {
  late final segmentLabels = [
    context.l10n.movies,
    context.l10n.series,
  ];

  late final filterLabels = [
    context.l10n.newest,
    context.l10n.oldest,
    context.l10n.top,
    context.l10n.order,
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 42.h),
          _buildTopSegmentedControl(),
          SizedBox(height: 20.h),
          _buildFilterChipGroups(),
          SizedBox(height: 24.h),
          _buildGridMovies(),
        ],
      ),
    );
  }

  Widget _buildTopSegmentedControl() {
    return SegmentedControl(labels: segmentLabels);
  }

  Widget _buildFilterChipGroups() {
    return FilterChipGroups(labels: filterLabels);
  }

  Widget _buildGridMovies() {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 68.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 102.w / 160.h,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          // TODO Fake data
          return Image.network(
            "https://w0.peakpx.com/wallpaper/698/738/HD-wallpaper-one-piece-strong-world-movie-action-zorro-franky-nico-robin-brook-one-piece-monkey-d-ruffy-strong-world-anime-luffy-ten-tony-chopper-lysopp-10th-nami-adventure-sanji-eiichiro-oda.jpg",
            width: 102.w,
            height: 160.h,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
