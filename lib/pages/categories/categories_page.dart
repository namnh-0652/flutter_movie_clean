import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<StatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with AutomaticKeepAliveClientMixin {
  // TODO Update UI later
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(
      child: Text("CategoriesPage"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
