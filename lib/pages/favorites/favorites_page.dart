import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});
  static const String routeLocation = "/favorites";
  static const String routeName = "favorites";

  @override
  State<StatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(
      child: Text("FavoritesPage"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
