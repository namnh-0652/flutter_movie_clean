import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/app_viewmodel.dart';
import 'package:flutter_movie_clean/di/view_model_provider.dart';
import 'package:flutter_movie_clean/presentation/components/primary_textfield.dart';
import 'package:flutter_movie_clean/presentation/components/secondary_button.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_avatar/account_create_avatar_page.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_pin/account_create_pin_page.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_movie_clean/shared/utils/validate_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountCreatePasswordPage extends ConsumerStatefulWidget {
  const AccountCreatePasswordPage({Key? key}) : super(key: key);

  static const String routeLocation = "/createPassword";
  static const String routeName = "create_password";

  @override
  AccountCreatePasswordPageState createState() =>
      AccountCreatePasswordPageState();
}

class AccountCreatePasswordPageState
    extends ConsumerState<AccountCreatePasswordPage>
    with WidgetsBindingObserver {
  final TextEditingController _passwordTextController = TextEditingController();
  late final AppViewModel _authViewModel;
  bool isKeyboardVisible = false;

  bool _isEnableBtn = false;
  bool _isObsecureText = true;

  void _updateBtnState() {
    setState(() {
      _isEnableBtn = ValidateHelper.validatePassword(
            context,
            _passwordTextController.text,
          ) ==
          null;
    });
  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordTextController.addListener(_updateBtnState);
    _authViewModel = ref.read(appViewModelProvider);
    super.initState();
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
                  SizedBox(height: 32.h),
                  Assets.images.icLogo.svg(),
                  SizedBox(height: 21.h),
                  _buildTextDescription(),
                  SizedBox(height: 20.h),
                  _buildAvatar(),
                  SizedBox(height: 12.h),
                  _buildTextUsername(),
                  SizedBox(height: 27.h),
                  _buildTextFieldPassword(),
                  SizedBox(height: 8.h),
                  _buildTextPasswordRuleDescription(),
                  SizedBox(height: 20.h)
                ],
              ),
            ),
          ),
          _buildBtn(),
        ],
      ),
    );
  }

  Widget _buildBtn() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
          bottom: isKeyboardVisible ? 20.h : 80.h, left: 30.w, right: 30.w),
      child: SecondaryButton(
        backgroundColor:
            _isEnableBtn ? AppColors.crimsonApprox : AppColors.black,
        width: 1.sw,
        height: 50.h,
        title: context.l10n.looksStrong,
        onPressed: _isEnableBtn
            ? () {
                _authViewModel.setProfile(
                  password: _passwordTextController.text,
                );
                _gotoCreatePinPage();
              }
            : null,
      ),
    );
  }

  Widget _buildTextDescription() {
    return Text(
      context.l10n.chooseAPassword,
      style: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 23.78.sp,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _buildTextPasswordRuleDescription() {
    return SizedBox(
      width: 250.w,
      child: Text(
        context.l10n.passwordDescription,
        style: GoogleFonts.inter(
          color: AppColors.white.withOpacity(0.3),
          fontSize: 14.sp,
          fontWeight: FontWeight.w900,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildAvatar() {
    return SizedBox(
      width: 120.w,
      height: 120.w,
      child: Stack(
        children: [
          Center(
            child: AssetGenImage(
              _authViewModel.profile?.imagePath ??
                  Assets.images.profile.profile1.path,
            ).image(width: 120.w, height: 120.w, fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 32.w,
              height: 32.w,
              child: MaterialButton(
                padding: EdgeInsets.all(4.w),
                color: AppColors.white,
                highlightColor: AppColors.black.withOpacity(0.1),
                shape: const CircleBorder(),
                onPressed: () =>
                    context.go(AccountCreateAvatarPage.routeLocation),
                child: Center(
                  child: Icon(
                    Icons.cameraswitch,
                    size: 24.w,
                    color: AppColors.crimsonApprox,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextUsername() {
    return Text(
      _authViewModel.profile?.username ?? "",
      style: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _buildTextFieldPassword() {
    return SizedBox(
      width: 250.w,
      height: 50.h,
      child: PrimaryTextField(
        obscureText: _isObsecureText,
        textStyle: GoogleFonts.inter(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
        options:
            InputOptions(maxLines: 1, textInputAction: TextInputAction.done),
        hintStyle: GoogleFonts.inter(
            color: AppColors.white.withOpacity(0.20),
            fontSize: 18,
            fontWeight: FontWeight.w800),
        hintText: context.l10n.password,
        suffix: GestureDetector(
          child: _isObsecureText
              ? Text(context.l10n.show)
              : Text(context.l10n.hide),
          onTap: () {
            setState(() {
              _isObsecureText = !_isObsecureText;
            });
          },
        ),
        controller: _passwordTextController,
        border: InputBorder.none,
        backgroundColor: AppColors.white.withOpacity(0.20),
      ),
    );
  }

  _gotoCreatePinPage() {
    context.pushNamed(AccountCreatePinPage.routeName);
  }
}
