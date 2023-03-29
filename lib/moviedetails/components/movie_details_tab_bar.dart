import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/generated/locale_keys.g.dart';
import 'package:flutter_movie_clean/moviedetails/components/tabs/cast_tab.dart';
import 'package:flutter_movie_clean/moviedetails/components/tabs/more_tab.dart';
import 'package:flutter_movie_clean/moviedetails/components/tabs/trailer_tab.dart';

import '../../generated/colors.gen.dart';

class MovieDetailsTabBar extends StatelessWidget {
  const MovieDetailsTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: ColorName.mineShaftApprox,
            child: TabBar(
              tabs: [
                SizedBox(height: 35.0, child: _individualTab(context, LocaleKeys.trailer.tr())),
                SizedBox(height: 35.0, child: _individualTab(context, LocaleKeys.cast.tr())),
                SizedBox(
                  height: 35.0,
                  child: _individualTab(context, LocaleKeys.more.tr(), hasRightBorder: false),
                ),
              ],
              labelColor: ColorName.silverApprox,
              unselectedLabelColor: ColorName.silverApprox,
              indicatorColor: ColorName.crimsonApprox,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              labelPadding: const EdgeInsets.all(0),
              indicatorPadding: const EdgeInsets.all(0),
            ),
          ),
          const SizedBox(
            height: 270.0,
            child: TabBarView(children: [
              TrailerTab(),
              CastTab(),
              MoreTab(),
            ]),
          ),
        ],
      ),
    );
  }
}

Widget _individualTab(BuildContext context, String tabName, {bool hasRightBorder = true}) {
  return hasRightBorder
      ? Container(
          height: 35.0,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: ColorName.scorpionApprox,
                width: 1.5,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Tab(
            child: Text(
              tabName,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        )
      : Tab(
          child: Text(tabName,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
        );
}
