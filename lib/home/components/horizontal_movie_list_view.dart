import 'package:flutter/material.dart';

class HorizontalMoviesListView extends StatelessWidget {
  const HorizontalMoviesListView({
    super.key,
    required List<String> paths,
    required this.itemWidth,
    required this.itemHeight,
    required this.onItemTapped,
  }) : _paths = paths;

  final List<String> _paths;
  final double itemWidth;
  final double itemHeight;
  final Function(int index) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: _paths.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
        ),
        child: GestureDetector(
          child: Image.asset(
            _paths.elementAt(index),
            fit: BoxFit.cover,
            width: itemWidth,
            height: itemHeight,
          ),
          onTap: () => {onItemTapped(index)},
        ),
      ),
    );
  }
}
