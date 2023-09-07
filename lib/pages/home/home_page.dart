import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/components/app_loading.dart';
import 'package:flutter_movie_clean/components/avatar_frame.dart';
import 'package:flutter_movie_clean/di/view_model_provider.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/pages/home/components/carousel_page_view.dart';
import 'package:flutter_movie_clean/pages/home/components/skeleton_carousel_movies.dart';
import 'package:flutter_movie_clean/pages/home/components/skeleton_trending_movies.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final viewModel = ref.read(homeViewModelProvider);
    viewModel.getLatestMovies();
    viewModel.getLatestSeries();
    viewModel.getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Material(
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
            Consumer(builder: (context, ref, child) {
              final isLoading = ref.watch(
                homeViewModelProvider.select((value) => value.isLoading),
              );
              return AppLoading(isLoading: isLoading);
            }),
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
      final latestMovies = ref.watch(
        homeViewModelProvider.select((value) => value.latestMovies),
      );
      return latestMovies.maybeWhen(
        data: (movies) {
          return CarouselPageView.builder(
            height: 204.h,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Image.network(
                movies[index].posterPath ?? '',
                fit: BoxFit.cover,
              );
            },
          );
        },
        orElse: () => const SkeletonCarouselMovies(),
      );
    });
  }

  Widget _buildLatestSeries() {
    return Consumer(builder: (context, ref, child) {
      final latestSeries = ref.watch(
        homeViewModelProvider.select((value) => value.latestSeries),
      );
      return latestSeries.maybeWhen(
        data: (series) {
          return CarouselPageView.builder(
            height: 204.h,
            itemCount: series.length,
            itemBuilder: (context, index) {
              return Image.network(
                series[index].posterPath ?? '',
                fit: BoxFit.cover,
              );
            },
          );
        },
        orElse: () => const SkeletonCarouselMovies(),
      );
    });
  }

  Widget _buildTrendingToday() {
    return SizedBox(
      width: 204.h,
      height: 150.h,
      child: Consumer(builder: (context, ref, child) {
        final trendingMovies = ref.watch(
          homeViewModelProvider.select((value) => value.trendingMovies),
        );
        return trendingMovies.maybeWhen(
          data: (movies) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 12.w);
              },
              itemBuilder: (context, index) {
                return Image.network(
                  movies[index].posterPath ?? "",
                  width: 100.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                );
              },
            );
          },
          orElse: () => const SkeletonTrendingMovies(),
        );
      }),
    );
  }
}
