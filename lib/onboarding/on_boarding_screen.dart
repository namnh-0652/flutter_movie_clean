import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/generated/assets.gen.dart';
import 'package:flutter_movie_clean/generated/locale_keys.g.dart';

import 'component/on_boarding_end_page.dart';
import 'component/on_boarding_item_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool _isEndPage = false;
  final List<String> _titles = [
    LocaleKeys.on_boarding_page_1_title.tr(),
    LocaleKeys.on_boarding_page_2_title.tr(),
    LocaleKeys.on_boarding_page_3_title.tr(),
    LocaleKeys.on_boarding_page_4_title.tr(),
    LocaleKeys.on_boarding_page_5_title.tr(),
  ];
  String _title = '';
  final List<String> _posterPaths = [
    Assets.images.poster1.path,
    Assets.images.poster2.path,
    Assets.images.poster3.path,
    Assets.images.poster4.path,
    Assets.images.poster5.path,
    Assets.images.poster6.path,
  ];

  final Gradient _maskingGradient = const LinearGradient(
    colors: [Colors.transparent, Colors.black],
    stops: [0.0, 0.8],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  void initState() {
    super.initState();
    _title = _titles.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
            blendMode: BlendMode.darken,
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _isEndPage = index == _titles.length ? true : false;
                  _title = index < _titles.length ? _titles.elementAt(index) : '';
                });
              },
              children: _posterPaths.map((path) => _posterItemPageView(path)).toList(),
            ),
          ),
          _isEndPage
              ? OnBoardingEndPage(controller: _controller, context: context)
              : OnBoardingItemPage(controller: _controller, title: _title, context: context)
        ],
      ),
    );
  }

  Widget _posterItemPageView(String poster) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            width: double.infinity,
            poster,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 150.0,
          color: Colors.black,
        )
      ],
    );
  }
}
