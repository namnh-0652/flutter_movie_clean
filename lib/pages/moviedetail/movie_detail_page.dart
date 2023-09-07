import 'package:domain/model/cast.dart';
import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/components/secondary_button.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/pages/moviedetail/components/cast_tab.dart';
import 'package:flutter_movie_clean/pages/moviedetail/components/more_tab.dart';
import 'package:flutter_movie_clean/pages/moviedetail/components/trailer_tab.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../gen/assets.gen.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);
  static const String routeLocation = "/movies";
  static const String routeName = "movies";
  final Movie movie;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  bool fixedScroll = false;
  List<Widget> tabViews = [];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopPage(context),
              SizedBox(
                height: 20.h,
                width: 1.sh,
              ),
              _buildFunction(context),
              _buildOverview(),
              _buildBottom(context),
              _buildBottom2()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopPage(BuildContext buildContext) {
    return SizedBox(
      height: MediaQuery.of(buildContext).size.height * 0.6,
      width: MediaQuery.of(buildContext).size.width,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) => const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    colors: [Colors.transparent, Colors.black])
                .createShader(bounds),
            blendMode: BlendMode.darken,
            child: Image.network(
              widget.movie.posterPath ?? "",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 16.h,
            left: 12.w,
            child: GestureDetector(
              onTap: () {
                buildContext.pop();
              },
              child: Assets.images.icBack.svg(),
            ),
          ),
          Positioned(
              top: 58.h,
              left: 64.w,
              right: 64.w,
              child: Center(
                child: Text(
                  widget.movie.title ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800),
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 12.h,
              child:
                  InkWell(onTap: () {}, child: Assets.images.icPlayRed.svg()))
        ],
      ),
    );
  }

  Widget _buildFunction(BuildContext buildContext) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SecondaryButton(
            width: 150,
            title: buildContext.l10n.download,
            textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: AppColors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: buildContext.l10n.plus,
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp)),
              TextSpan(
                  text: buildContext.l10n.addToWatchList,
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp))
            ]),
          ),
        )
      ],
    );
  }

  Widget _buildOverview() {
    return Padding(
      padding:
          EdgeInsets.only(left: 12.w, top: 16.h, right: 12.w, bottom: 12.h),
      child: Text(
        widget.movie.overview ?? "",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: [
        _buildTabLabel(context.l10n.trailer, false),
        _buildTabLabel(context.l10n.cast, true),
        _buildTabLabel(context.l10n.more, false)
      ],
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      labelColor: AppColors.white80,
      indicatorWeight: 3.h,
      labelPadding: const EdgeInsets.all(0),
      labelStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 16.sp),
      indicatorPadding: const EdgeInsets.all(0),
      indicatorColor: AppColors.crimsonApprox,
    );
  }

  Widget _buildBottom2() {
    return SizedBox(
      height: 300.h,
      child: TabBarView(controller: _tabController, children: [
        TrailerTab(backdropPath: widget.movie.backdropPath ?? ""),
        CastTab(casts: castsData,),
        MoreTab(recommendMovies: moresData)
      ]),
    );
  }

  Widget _buildTabLabel(String label, bool hasDivider) {
    return hasDivider
        ? Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: AppColors.white25, width: 1.w),
                    right: BorderSide(color: AppColors.white25, width: 1.w))),
            child: Tab(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  label,
                ),
              ),
            ),
          )
        : Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                label,
              ),
            ),
          );
  }
}

final castsData = [
  Cast(
      name: "Paul Batteny",
      image:
          "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg",
      role: "Vision"),
  Cast(
      name: "Paul Batteny",
      image:
          "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg",
      role: "Vision"),
  Cast(
      name: "Paul Batteny",
      image:
          "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg",
      role: "Vision"),
  Cast(
      name: "Paul Batteny",
      image:
          "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg",
      role: "Vision"),
  Cast(
      name: "Paul Batteny",
      image:
          "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg",
      role: "Vision"),
  Cast(
      name: "Paul Batteny",
      image:
          "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg",
      role: "Vision"),
  Cast(
      name: "Paul Batteny",
      image:
          "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg",
      role: "Vision"),
  Cast(
      name: "Paul Batteny",
      image:
          "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg",
      role: "Vision"),
];

final moresData = [
  Movie(
      posterPath:
          "https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg",
      title: "Avatar",
      releaseDate: "2005")
];
