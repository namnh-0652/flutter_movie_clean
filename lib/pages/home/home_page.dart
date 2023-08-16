import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/pages/home/components/carousel_page_view.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeLocation = "/home";
  static const String routeName = "home";

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 28.h, bottom: 16.h),
        color: AppColors.black,
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Assets.images.icMarvelRed.svg(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildAvatarFrame(),
                ),
              ],
            ),
            _buildHeadingTitle(context.l10n.latestMovies),
            CarouselPageView.builder(
              height: 204.h,
              itemCount: _posters.length,
              itemBuilder: (context, index) {
                return Image.network(_posters[index], fit: BoxFit.cover);
              },
            ),
            _buildHeadingTitle(context.l10n.latestSeries),
            CarouselPageView.builder(
              height: 204.h,
              itemCount: _posters.length,
              itemBuilder: (context, index) {
                return Image.network(_posters[index], fit: BoxFit.cover);
              },
            ),
            _buildHeadingTitle(context.l10n.trendingToday),
            SizedBox(
              height: 150.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: _posters.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 12.w);
                },
                itemBuilder: (context, index) {
                  return Image.network(
                    _posters[index],
                    width: 100.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarFrame() {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Assets.images.avatarFrame.svg(
            width: 70.w,
            height: 70.h,
          ),
          Assets.images.spidermanPlaceholder.image(
            width: 54.w,
            height: 54.h,
          ),
        ],
      ),
    );
  }

  Widget _buildHeadingTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// TODO Fake data. Remove later
List<String> _posters = [
  "https://w0.peakpx.com/wallpaper/698/738/HD-wallpaper-one-piece-strong-world-movie-action-zorro-franky-nico-robin-brook-one-piece-monkey-d-ruffy-strong-world-anime-luffy-ten-tony-chopper-lysopp-10th-nami-adventure-sanji-eiichiro-oda.jpg",
  "https://w0.peakpx.com/wallpaper/698/738/HD-wallpaper-one-piece-strong-world-movie-action-zorro-franky-nico-robin-brook-one-piece-monkey-d-ruffy-strong-world-anime-luffy-ten-tony-chopper-lysopp-10th-nami-adventure-sanji-eiichiro-oda.jpg",
  "https://w0.peakpx.com/wallpaper/698/738/HD-wallpaper-one-piece-strong-world-movie-action-zorro-franky-nico-robin-brook-one-piece-monkey-d-ruffy-strong-world-anime-luffy-ten-tony-chopper-lysopp-10th-nami-adventure-sanji-eiichiro-oda.jpg",
  "https://w0.peakpx.com/wallpaper/698/738/HD-wallpaper-one-piece-strong-world-movie-action-zorro-franky-nico-robin-brook-one-piece-monkey-d-ruffy-strong-world-anime-luffy-ten-tony-chopper-lysopp-10th-nami-adventure-sanji-eiichiro-oda.jpg",
  "https://w0.peakpx.com/wallpaper/698/738/HD-wallpaper-one-piece-strong-world-movie-action-zorro-franky-nico-robin-brook-one-piece-monkey-d-ruffy-strong-world-anime-luffy-ten-tony-chopper-lysopp-10th-nami-adventure-sanji-eiichiro-oda.jpg",
];
