import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/presentation/components/secondary_button.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_usename/profile_create_username_page.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountCreateAvatarPage extends StatefulWidget {
  const AccountCreateAvatarPage({Key? key}) : super(key: key);

  static const String routeLocation = "/createAvatar";
  static const String routeName = "createAvatar";

  @override
  State<AccountCreateAvatarPage> createState() =>
      _AccountCreateAvatarPageState();
}

class _AccountCreateAvatarPageState extends State<AccountCreateAvatarPage> {
  late final List<AssetGenImage> _imageProfiles;
  late final List<GlobalKey> _profileItemGlobalKeys;
  late final GlobalKey gridViewKey = GlobalKey();

  int _itemSelectedIndex = -1;
  Offset? offsetSelected;

  @override
  void initState() {
    _imageProfiles = Assets.images.profile.values;
    _profileItemGlobalKeys = _imageProfiles.map((e) => GlobalKey()).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 32.h),
            Assets.images.icLogo.svg(),
            SizedBox(height: 11.h),
            _buildTextDescription(),
            SizedBox(height: 20.h),
            _buildContentApp(),
            SizedBox(height: 28.h),
            _buildBtnAcceptAvatarSelected(),
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBtnAcceptAvatarSelected() {
    return SecondaryButton(
      backgroundColor:
          _itemSelectedIndex != -1 ? AppColors.crimsonApprox : AppColors.black,
      width: 1.sw - 60.w,
      height: 50.h,
      title: context.l10n.looksGood,
      onPressed: _itemSelectedIndex != -1
          ? () {
              context.pushNamed(ProfileCreateUserPage.routeName, extra: {
                "imagePath": _imageProfiles[_itemSelectedIndex].path
              });
            }
          : null,
    );
  }

  Widget _buildTextDescription() {
    return Text(
      context.l10n.chooseYourAvatar,
      style: GoogleFonts.inter(
          color: AppColors.white,
          fontSize: 23.78.sp,
          fontWeight: FontWeight.w900),
    );
  }

  Widget _buildContentApp() {
    return Stack(
      children: [
        offsetSelected != null
            ? AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: offsetSelected?.dx ?? 0,
                top: offsetSelected?.dy ?? 0,
                curve: Curves.easeInOutBack,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white.withOpacity(0.25),
                        blurRadius: 10,
                        offset: Offset(5.w, 5.h),
                      )
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  width: 100.w,
                  height: 100.w,
                ),
              )
            : const SizedBox(),
        GridView.count(
          key: gridViewKey,
          clipBehavior: Clip.none,
          crossAxisCount: 2,
          padding: const EdgeInsets.all(0),
          childAspectRatio: 200 / 140,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: _buildListItem(gridViewKey),
        ),
      ],
    );
  }

  List<Widget> _buildListItem(GlobalKey parentKey) {
    return _imageProfiles.mapIndexed((index, element) {
      return GestureDetector(
        onTap: () {
          setState(() {
            offsetSelected = getOffsetItemSelected(index, parentKey);
            _itemSelectedIndex = index;
          });
        },
        child: Center(
          child: SizedBox(
            key: _profileItemGlobalKeys[index],
            width: 100.w,
            height: 100.w,
            child:
                element.image(width: 100.w, height: 100.w, fit: BoxFit.cover),
          ),
        ),
      );
    }).toList();
  }

  Offset? getOffsetItemSelected(int indexSelected, GlobalKey parentKey) {
    RenderBox? child = _profileItemGlobalKeys[indexSelected]
        .currentContext
        ?.findRenderObject() as RenderBox?;
    Offset? childOffset = child?.localToGlobal(Offset.zero);
    RenderBox? parent =
        parentKey.currentContext?.findRenderObject() as RenderBox?;
    Offset? childRelativeToParent =
        parent?.globalToLocal(childOffset ?? Offset.zero);

    return childRelativeToParent;
  }
}
