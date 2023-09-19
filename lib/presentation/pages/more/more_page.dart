import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/presentation/pages/login/login.dart';
import 'package:go_router/go_router.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<StatefulWidget> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> with AutomaticKeepAliveClientMixin {
  // TODO Update UI later
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("MorePage"),
          TextButton(onPressed: () => context.go(LoginPage.routeLocation), child: const Text("Logout"))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
