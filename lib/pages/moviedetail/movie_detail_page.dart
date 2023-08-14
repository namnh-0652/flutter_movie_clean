import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/pages/moviedetail/movie_detail_page2.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:go_router/go_router.dart';

import '../../gen/colors.gen.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, this.id});

  static const String routeLocation = "/movies";
  static const String routeName = "movies";

  final int? id;

  @override
  Widget build(BuildContext context) {
    debugPrint("build MovieDetailPage");
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 56),
          Text("MovieDetailPage id $id"),
          const SizedBox(height: 16),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.all(8),
            ),
            onPressed: () {
              // context.go("/movies/:id/movies2");
              // context.pushNamed(MovieDetailPage2.routeName);
              context.go(context.goRouterState.matchedLocation + MovieDetailPage2.routeLocation);
            },
            child: const Text(
              "Go to movie detail 2222",
              style: TextStyle(color: AppColors.white),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: 40,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal,
                  child: Text("Movies No. $index"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
