import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/model/enums/category_type.dart';
import 'package:flutter_movie_clean/presentation/model/enums/sort_type.dart';
import 'package:flutter_movie_clean/presentation/model/poster.dart';
import 'package:flutter_movie_clean/presentation/pages/categories/categories_view_model.dart';
import 'package:flutter_movie_clean/presentation/pages/categories/components/filter_chip_group.dart';
import 'package:flutter_movie_clean/presentation/pages/categories/components/segmented_control.dart';
import 'package:flutter_movie_clean/presentation/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/shared/constant/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  CategoriesPageState createState() => CategoriesPageState();
}

class CategoriesPageState extends ConsumerState<CategoriesPage>
    with AutomaticKeepAliveClientMixin {
  final _pagingController = PagingController<int, Poster>(
    firstPageKey: initialPage,
  );

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData();
    });
  }

  void _initData() {
    final viewModel = ref.read(categoriesViewModelProvider.notifier);
    viewModel.fetchPostersByCategory(initialPage);
    _pagingController.addPageRequestListener((pageKey) {
      viewModel.fetchPostersByCategory(pageKey);
    });
  }

  void _observePosters() {
    ref.listen(
      categoriesViewModelProvider.select((value) => value),
      (previous, next) {
        final pagingData = next.asData?.value;
        if (pagingData == null) return;
        _pagingController.appendPage(pagingData.data, pagingData.nextPage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _observePosters();
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 10.h),
            _buildTopSegmentedControl(),
            SizedBox(height: 20.h),
            _buildFilterChipGroups(),
            SizedBox(height: 24.h),
            _buildGridMovies(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSegmentedControl() {
    return SegmentedControl(
      labels: CategoryType.values.map((e) => e.getLabel(context)).toList(),
      onSegmentChanged: (index) {
        final viewModel = ref.read(categoriesViewModelProvider.notifier);
        if (viewModel.isSameCategory(CategoryType.values[index])) return;
        viewModel.selectedCategoryType = CategoryType.values[index];
        viewModel.fetchPostersByCategory(initialPage);
        _pagingController.refresh();
      },
    );
  }

  Widget _buildFilterChipGroups() {
    return FilterChipGroups(
      labels: SortType.values.map((e) => e.getLabel(context)).toList(),
      onChipSelected: (index) {
        final viewModel = ref.read(categoriesViewModelProvider.notifier);
        if (viewModel.isSameSortType(SortType.values[index])) return;
        viewModel.selectedSortType = SortType.values[index];
        viewModel.fetchPostersByCategory(initialPage);
        _pagingController.refresh();
      },
    );
  }

  Widget _buildGridMovies() {
    return Expanded(
      child: PagedGridView<int, Poster>(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        pagingController: _pagingController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 102.w / 160.h,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        builderDelegate: PagedChildBuilderDelegate<Poster>(
          itemBuilder: (context, item, index) {
            return GestureDetector(
              onTap: () {
                if (ref
                        .read(categoriesViewModelProvider.notifier)
                        .selectedCategoryType ==
                    CategoryType.movies) {
                  context.push(MovieDetailPage.routeLocation, extra: item.id);
                }
              },
              child: Image.network(
                item.posterUrl ?? '',
                width: 102.w,
                height: 160.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: AppColors.mineShaft);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
