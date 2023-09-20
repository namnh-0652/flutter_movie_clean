import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/presentation/components/pin_form.dart';
import 'package:flutter_movie_clean/presentation/components/secondary_button.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_success/account_create_success_screen.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountCreatePinPage extends StatefulWidget {
  const AccountCreatePinPage({this.imagePath, this.username, Key? key}) : super(key: key);

  static const String routeLocation = "/createPin";
  static const String routeName = "createPin";

  final String? imagePath;
  final String? username;
  @override
  State<AccountCreatePinPage> createState() => _AccountCreatePinPageState();
}

class _AccountCreatePinPageState extends State<AccountCreatePinPage> with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  bool _isEnableBtn = false;
  final pin = ["", "", "", ""];

  void _updateStateCreateButton(String value) {
    setState(() {
      _isEnableBtn = value.length == pin.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildLogo(),
                  _buildTextDescription(),
                  SizedBox(height: 48.h),
                  _builImageProfile(),
                  SizedBox(height: 24.h),
                  _buildPinForm(),
                  _buildTextInfo(),
                  SizedBox(height: 20.h),
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
      margin: EdgeInsets.only(bottom: isKeyboardVisible ? 20.h : 80.h, left: 30.w, right: 30.w),
      child: SecondaryButton(
        backgroundColor: _isEnableBtn ? AppColors.crimsonApprox : AppColors.black,
        width: 1.sw,
        height: 50.h,
        title: context.l10n.iamAllSafeNow,
        onPressed: _isEnableBtn
            ? () => context.go(AccountCreateSuccessPage.routeLocation, extra: {
                  "imagePath": widget.imagePath,
                  "username": widget.username,
                })
            : null,
      ),
    );
  }

  Container _buildTextInfo() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 64.w, right: 64.w, top: 20.h),
      child: Text(
        context.l10n.createPinDescription,
        style: GoogleFonts.inter(
            fontSize: 16.sp, fontWeight: FontWeight.w800, color: AppColors.white.withOpacity(0.5)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Padding _buildPinForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 64.w),
      child: PinForm(
        pinData: pin,
        onPinChange: (value) => _updateStateCreateButton(value),
      ),
    );
  }

  Widget _builImageProfile() {
    return AssetGenImage(
      widget.imagePath ?? Assets.images.profile.profile1.path,
    ).image(
      width: 120,
      height: 120,
      fit: BoxFit.cover,
    );
  }

  Text _buildTextDescription() {
    return Text(
      context.l10n.createAPin,
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
      width: 188.23.w,
      height: 85.19.h,
      padding: EdgeInsets.fromLTRB(7.74.w, 12.09.h, 6.22.w, 10.81.h),
      child: Assets.images.icLogo.svg(),
    );
  }
}
