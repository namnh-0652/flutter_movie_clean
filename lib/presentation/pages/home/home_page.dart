import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_clean/di/view_model_provider.dart';
import 'package:flutter_movie_clean/di2/service_locator.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/components/avatar_frame.dart';
import 'package:flutter_movie_clean/presentation/pages/home/bloc/home_cubit.dart';
import 'package:flutter_movie_clean/presentation/pages/home/bloc/home_state.dart';
import 'package:flutter_movie_clean/presentation/pages/home/components/carousel_page_view.dart';
import 'package:flutter_movie_clean/presentation/pages/home/components/skeleton_carousel_movies.dart';
import 'package:flutter_movie_clean/presentation/pages/home/components/skeleton_trending_movies.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeLocation = "/home";
  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) {
        return locator.get<HomeCubit>()..getLatestMovies();
      },
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
                // _buildLatestSeries(),
                _buildHeadingTitle(context.l10n.trendingToday),
                // _buildTrendingToday(),
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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final movies = state.trendingMovies;
        if (movies != null) {
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
        } else {
          return const SkeletonCarouselMovies();
        }
      },
    );
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
                return GestureDetector(
                  onTap: () {
                    context.push(MovieDetailPage.routeLocation,
                        extra: movies[index].id);
                  },
                  child: Image.network(
                    movies[index].posterPath ?? "",
                    width: 100.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
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
