import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/di/view_model_provider.dart';
import 'package:flutter_movie_clean/presentation/pages/login/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MorePage extends ConsumerStatefulWidget {
  const MorePage({super.key});

  @override
  MorePageState createState() => MorePageState();
}

class MorePageState extends ConsumerState<MorePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    ref.listen(appViewModelProvider.select((vm) => vm.logoutState),
        (prevState, newState) {
      if (newState?.hasValue == true) {
        context.goNamed(LoginPage.routeName);
      }
    });
    super.build(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("MorePage"),
          TextButton(
              onPressed: () {
                ref.read(appViewModelProvider).logout();
              },
              child: const Text("Logout"))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
