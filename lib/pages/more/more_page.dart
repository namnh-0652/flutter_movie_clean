import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});
  static const String routeLocation = "/more";
  static const String routeName = "more";

  @override
  State<StatefulWidget> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(
      child: Text("MorePage"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
