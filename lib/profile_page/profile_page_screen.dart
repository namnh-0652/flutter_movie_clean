import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/generated/assets.gen.dart';
import 'package:flutter_movie_clean/generated/colors.gen.dart';
import 'package:flutter_movie_clean/generated/locale_keys.g.dart';
import '../suport/common/common_button.dart';
import 'components/list_avatar_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  int? selectItem;

  onTapItemGridView(int index) {
    setState(() {
      selectItem = selectItem == index ? null : index;
    });
  }

  onTapSelectAvatar() {
    // Add action later
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.black,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12),
            child: Image.asset(
              Assets.images.marvelLogo.path,
              width: 150,
              height: 68,
            ),
          ),
          Text(LocaleKeys.profile_page_title,
                  style: Theme.of(context).textTheme.titleLarge)
              .tr(),
          const SizedBox(height: 12),
          ListAvatarProfile(selectItem, (index) => onTapItemGridView(index)),
          const SizedBox(height: 28),
          CommonButton(LocaleKeys.profile_page_submit, selectItem != null,
              () => onTapSelectAvatar)
        ],
      )),
    );
  }
}
