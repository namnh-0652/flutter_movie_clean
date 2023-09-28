import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/presentation/components/app_loading.dart';
import 'package:flutter_movie_clean/presentation/components/avatar_frame.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/home/components/skeleton_carousel_movies.dart';
import 'package:flutter_movie_clean/presentation/pages/home/components/skeleton_trending_movies.dart';
import 'package:flutter_movie_clean/presentation/pages/home/home_view_model.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static const String routeLocation = "/home";
  static const String routeName = "home";

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = ref.read(homeViewModelProvider.notifier);
      viewModel.getLatestMovies();
      viewModel.getLatestSeries();
      viewModel.getTrendingMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppLoading(
      child: Container(
        color: AppColors.black,
        child: Stack(
          children: [
            ListView(
              children: [
                _buildTopPage(),
                _buildHeadingTitle(context.l10n.latestMovies),
                _buildLatestMovies(),
                _buildHeadingTitle(context.l10n.latestSeries),
                _buildLatestSeries(),
                _buildHeadingTitle(context.l10n.trendingToday),
                _buildTrendingToday(),
                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarFrame() {
    return AvatarFrame(
      width: 70.h,
      height: 70.h,
      padding: EdgeInsets.only(right: 16.w),
      image: Assets.images.spidermanPlaceholder.image(
        width: 54.w,
        height: 54.h,
      ),
    );
  }

  Widget _buildTopPage() {
    return Stack(
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

  Widget _buildLatestMovies() {
    return Consumer(builder: (context, ref, child) {
      final latestMovies = ref
          .watch(homeViewModelProvider.select((value) => value.latestMovies));
      if (latestMovies == null) {
        return const SkeletonCarouselMovies();
      } else {
        return CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 0.7,
            enlargeCenterPage: true,
            pageSnapping: true,
            enableInfiniteScroll: false,
            initialPage: 1,
            enlargeFactor: 0.25,
          ),
          itemCount: latestMovies.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () {
                context.push(MovieDetailPage.routeLocation,
                    extra: latestMovies[index].id);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  latestMovies[index].posterPath ?? '',
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }
    });
  }

  Widget _buildLatestSeries() {
    return Consumer(builder: (context, ref, child) {
      final tvSeries =
          ref.watch(homeViewModelProvider.select((value) => value.tvSeries));
      if (tvSeries == null) {
        return const SkeletonCarouselMovies();
      } else {
        return CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 0.7,
            enlargeCenterPage: true,
            pageSnapping: true,
            enableInfiniteScroll: false,
            initialPage: 1,
            enlargeFactor: 0.25,
          ),
          itemCount: tvSeries.length,
          itemBuilder: (context, index, realIndex) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                tvSeries[index].posterPath ?? '',
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }
    });
  }

  Widget _buildTrendingToday() {
    return SizedBox(
      width: 204.w,
      height: 150.h,
      child: Consumer(builder: (context, ref, child) {
        final trendingMovies = ref.watch(
            homeViewModelProvider.select((value) => value.trendingMovies));
        if (trendingMovies == null) {
          return const SkeletonTrendingMovies();
        } else {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: trendingMovies.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 12.w);
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.push(MovieDetailPage.routeLocation,
                      extra: trendingMovies[index].id);
                },
                child: Image.network(
                  trendingMovies[index].posterPath ?? "",
                  width: 100.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }
      }),
    );
  }
}
