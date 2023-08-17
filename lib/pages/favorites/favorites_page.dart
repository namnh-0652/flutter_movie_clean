import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with AutomaticKeepAliveClientMixin {
  // TODO Update UI later
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
