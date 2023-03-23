import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderShaderWidget extends StatelessWidget {
  const CarouselSliderShaderWidget({
    super.key,
    required List<String> paths, required this.onItemTapped,
  }) : _paths = paths;

  final Gradient _maskingGradient = const LinearGradient(
    colors: [
      Colors.black,
      Colors.transparent,
    ],
    stops: [0.0, 0.4],
    tileMode: TileMode.mirror,
    begin: Alignment.centerLeft,
    end: Alignment.center,
  );
  final List<String> _paths;
  final Function(int index) onItemTapped;
  
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      blendMode: BlendMode.darken,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 173.0,
          enlargeFactor: 0.2,
          viewportFraction: 0.7,
          enlargeCenterPage: true,
        ),
        items: _paths.map((path) {
          return Builder(builder: (BuildContext context) {
            return GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 6.0),
                decoration: const BoxDecoration(color: Colors.amber),
                child: Image.asset(path, fit: BoxFit.fill),
              ),
              onTap: () {onItemTapped(_paths.indexOf(path));},
            );
          });
        }).toList(),
      ),
    );
  }
}
