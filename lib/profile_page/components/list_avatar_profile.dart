import 'package:flutter/material.dart';
import '../../generated/assets.gen.dart';
import '../../suport/sliver_grid_delegate.dart';
import 'avatar_profile.dart';

class ListAvatarProfile extends StatelessWidget {
  final List<String> items = [
    Assets.images.avatar.avatar1.path,
    Assets.images.avatar.avatar2.path,
    Assets.images.avatar.avatar3.path,
    Assets.images.avatar.avatar4.path,
    Assets.images.avatar.avatar5.path,
    Assets.images.avatar.avatar6.path,
    Assets.images.avatar.avatar7.path,
    Assets.images.avatar.avatar8.path,
  ];
  final ValueChanged<int> onTapItemGridView;
  final int? selectItem;
  ListAvatarProfile(this.selectItem, this.onTapItemGridView);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: GridView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              height: 100.0),
      itemBuilder: (BuildContext context, int index) {
        return AvatarProfile(items[index], selectItem == index,
            () => {onTapItemGridView(index)});
      },
    ));
  }
}
