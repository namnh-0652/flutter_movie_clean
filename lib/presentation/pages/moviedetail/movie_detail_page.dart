import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/presentation/components/secondary_button.dart';
import 'package:flutter_movie_clean/di/view_model_provider.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/components/cast_tab.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/components/more_tab.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/components/trailer_tab.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieDetailPage extends ConsumerStatefulWidget {
  const MovieDetailPage({super.key, required this.movieId});
  static const String routeLocation = "/movies";
  static const String routeName = "movies";

  final int movieId;

  @override
  MovieDetailPageState createState() => MovieDetailPageState();
}

class MovieDetailPageState extends ConsumerState<MovieDetailPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _tabController;
  int _tabIndex = 0;
  List<Widget> tabViews = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _initData() {
    final viewModel = ref.read(movieDetailViewModelProvider(widget.movieId));
    viewModel.getMovieDetail(widget.movieId);
    viewModel.getCasts(widget.movieId);
    viewModel.getSimilarMovies(widget.movieId);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _tabIndex = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: ListView(
          children: [
            _buildTopPage(context),
            SizedBox(
              height: 20.h,
              width: 1.sw,
            ),
            _buildFunctions(context),
            _buildOverview(),
            _buildTabsLabel(context),
            _buildTabContent()
          ],
        ),
      ),
    );
  }

  Widget _buildTopPage(BuildContext buildContext) {
    final movie = ref.watch(movieDetailViewModelProvider(widget.movieId).select((value) => value.movie));
    return Consumer(
      builder: (context, ref, child) {
        return movie.maybeWhen(
            data: (movie) => SizedBox(
                  height: 0.6.sh,
                  width: 1.sw,
                  child: Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) => const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 1.0],
                            colors: [Colors.transparent, Colors.black]).createShader(bounds),
                        blendMode: BlendMode.darken,
                        child: Image.network(
                          movie.posterPath ?? "",
                          width: 1.sw,
                          fit: BoxFit.cover,
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
                              movie.title ?? "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 20.sp, fontWeight: FontWeight.w800),
                            ),
                          )),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 12.h,
                          child: InkWell(onTap: () {}, child: Assets.images.icPlayRed.svg()))
                    ],
                  ),
                ),
            orElse: () => SizedBox(
                  height: 0.6.sh,
                  width: 1.sw,
                ));
      },
    );
  }

  Widget _buildFunctions(BuildContext buildContext) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SecondaryButton(
            width: 150,
            title: buildContext.l10n.download,
            textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp, color: AppColors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: buildContext.l10n.plus,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp)),
              TextSpan(
                  text: buildContext.l10n.addToWatchList,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp))
            ]),
          ),
        )
      ],
    );
  }

  Widget _buildOverview() {
    final movie =
        ref.watch(movieDetailViewModelProvider(widget.movieId).select((value) => value.movie)).value;
    return Padding(
      padding: EdgeInsets.only(left: 12.w, top: 16.h, right: 12.w, bottom: 12.h),
      child: Text(
        movie?.overview ?? "",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTabsLabel(BuildContext context) {
    return Container(
      color: AppColors.mineShaft,
      child: TabBar(
        controller: _tabController,
        tabs: [
          _buildTabLabel(context.l10n.trailer, false),
          _buildTabLabel(context.l10n.cast, true),
          _buildTabLabel(context.l10n.more, false)
        ],
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: AppColors.white80,
        unselectedLabelColor: AppColors.white80,
        indicatorWeight: 3.h,
        labelPadding: const EdgeInsets.all(0),
        labelStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 16.sp),
        indicatorPadding: const EdgeInsets.all(0),
        indicatorColor: AppColors.crimsonApprox,
      ),
    );
  }

  Widget _buildTabContent() {
    final movie =
        ref.watch(movieDetailViewModelProvider(widget.movieId).select((value) => value.movie)).value;
    final casts =
        ref.watch(movieDetailViewModelProvider(widget.movieId).select((value) => value.casts)).value;
    final movies = ref
        .watch(movieDetailViewModelProvider(widget.movieId).select((value) => value.similarMovies))
        .value;
    tabViews = [
      TrailerTab(backdropPath: movie?.backdropPath ?? ""),
      CastTab(casts: casts?.cast ?? List.empty()),
      MoreTab(similarMovies: movies ?? List.empty())
    ];
    return tabViews[_tabIndex];
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
