import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/base/app_view_model_v1.dart';
import 'package:flutter_movie_clean/presentation/pages/login/login.dart';
import 'package:flutter_movie_clean/presentation/pages/more/more_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MorePage extends ConsumerStatefulWidget {
  const MorePage({super.key});

  @override
  ConsumerState<MorePage> createState() => _MorePageState();
}

class _MorePageState extends ConsumerState<MorePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final user = ref.watch(appViewModel1Provider.notifier).currentUser;
    ref.listen(moreViewModelProvider.select((value) => value),
        (previous, next) {
      if (next is AsyncData) {
        ref.read(appViewModel1Provider.notifier).loggedOut();
        context.go(LoginPage.routeLocation);
      }
    }, onError: (error, stackTrace) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Email: ${user?.email ?? ""}',
            style: const TextStyle(color: AppColors.black, fontSize: 20),
          ),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: () => ref.read(moreViewModelProvider.notifier).signOut(),
            child: const Text("Logout"),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
