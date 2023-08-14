import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../gen/colors.gen.dart';

class MovieDetailPage2 extends StatelessWidget {
  const MovieDetailPage2({super.key});
  static const String routeLocation = "/movies2";
  static const String routeName = "movies2";

  @override
  Widget build(BuildContext context) {
    debugPrint("build MovieDetailPage 22222");
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("MovieDetailPage 22222"),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.all(8),
            ),
            onPressed: () {
              context.go(MovieDetailPage2.routeLocation);
            },
            child: const Text(
              "Go to movie detail 2222 outer route",
              style: TextStyle(color: AppColors.white),
            ),
          )
        ],
      )
    );
  }
}
