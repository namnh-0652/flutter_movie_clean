import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/pages/moviedetail/movie_detail_page.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeLocation = "/home";
  static const String routeName = "home";

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.all(8),
        ),
        onPressed: () {
          // context.go(Uri(path: 'movies', queryParameters: {'id': '123'}).toString());
          // context.go(MovieDetailPage.routeLocation);
          context.go(context.goRouterState.matchedLocation +
              MovieDetailPage.routeLocation);
        },
        child: const Text(
          "Go to movie detail",
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}