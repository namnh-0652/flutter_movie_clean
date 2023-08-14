import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});
  static const String routeLocation = "/movies";
  static const String routeName = "movies";

  // TODO Update UI later
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text("MovieDetailPage"),
      ),
    );
  }
}
