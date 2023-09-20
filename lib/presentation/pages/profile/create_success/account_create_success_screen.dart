import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/presentation/components/primary_button.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/main/main_page.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountCreateSuccessPage extends StatelessWidget {
  const AccountCreateSuccessPage({
    this.imagePath,
    this.username,
    super.key,
  });

  static const String routeLocation = "/createPinSuccess";
  static const String routeName = "createPinSuccess";

  final String? imagePath;
  final String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildLogo(),
                  _buildTextDescription(context),
                  SizedBox(height: 62.h),
                  _buildProfileImage(),
                  SizedBox(height: 40.h),
                  _buildTextUsername()
                ],
              ),
            ),
          ),
          _buildBtn(context),
        ],
      ),
    );
  }

  Container _buildBtn(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 80.h, left: 30.w, right: 30.w),
      child: PrimaryButton(
        width: 1.sw,
        height: 50.h,
        title: context.l10n.eatYourGreenVegitables,
        onPressed: () {
          context.go(
            MainPage.routeLocation,
            extra: {
              "imagePath": imagePath,
              "username": username,
            },
          );
        },
      ),
    );
  }

  Text _buildTextUsername() {
    return Text(
      username ?? "",
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Stack _buildProfileImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        AssetGenImage(
          imagePath ?? Assets.images.profile.profile1.path,
        ).image(
          width: 200.h,
          height: 200.h,
          fit: BoxFit.cover,
        ),
        Assets.images.icBorderCircle.svg(
          width: 260.h,
          height: 260.h,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Text _buildTextDescription(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      context.l10n.yourProfileIsCreatednSuccessfully,
      style: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 23.78.sp,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Container _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 32.h, bottom: 29.11.h),
      color: AppColors.crimsonApprox,
      width: 188.23.h,
      height: 85.19.h,
      padding: EdgeInsets.fromLTRB(7.74.w, 12.09.h, 6.22.w, 10.81.h),
      child: Assets.images.icLogo.svg(),
    );
  }
}
