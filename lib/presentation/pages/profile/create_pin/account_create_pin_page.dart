import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/presentation/components/pin_form.dart';
import 'package:flutter_movie_clean/presentation/components/secondary_button.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_success/account_create_success_screen.dart';
import 'package:flutter_movie_clean/presentation/pages/signup/signup_view_model.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountCreatePinPage extends ConsumerStatefulWidget {
  const AccountCreatePinPage({Key? key}) : super(key: key);

  static const String routeLocation = "/createPin";
  static const String routeName = "createPin";

  @override
  ConsumerState<AccountCreatePinPage> createState() =>
      _AccountCreatePinPageState();
}

class _AccountCreatePinPageState extends ConsumerState<AccountCreatePinPage>
    with WidgetsBindingObserver {
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Assets.images.icLogo.svg(),
                    SizedBox(height: 20.h),
                    _buildTextDescription(),
                    SizedBox(height: 20.h),
                    _builImageProfile(),
                    SizedBox(height: 40.h),
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
      ),
    );
  }

  Container _buildBtn(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 20.h, left: 30.w, right: 30.w),
      child: SecondaryButton(
        backgroundColor:
            _isEnableBtn ? AppColors.crimsonApprox : AppColors.black,
        width: 1.sw,
        height: 50.h,
        title: context.l10n.iamAllSafeNow,
        onPressed: _isEnableBtn
            ? () {
                ref
                    .read(signUpViewModelProvider.notifier)
                    .updateUser(pin: pin.join());
                context.pushNamed(AccountCreateSuccessPage.routeName);
              }
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
          fontSize: 16.sp,
          fontWeight: FontWeight.w800,
          color: AppColors.white.withOpacity(0.5),
        ),
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
      ref.read(signUpViewModelProvider.notifier).signupUser?.avatar ??
          Assets.images.profile.profile1.path,
    ).image(
      width: 120.w,
      height: 120.w,
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
}
