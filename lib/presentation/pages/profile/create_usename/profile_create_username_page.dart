import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/presentation/components/primary_textfield.dart';
import 'package:flutter_movie_clean/presentation/components/secondary_button.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_password/account_create_password_page.dart';
import 'package:flutter_movie_clean/presentation/pages/signup/signup_view_model.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileCreateUserPage extends ConsumerStatefulWidget {
  const ProfileCreateUserPage({Key? key}) : super(key: key);

  static const String routeLocation = "/createUsername";
  static const String routeName = "createUsername";

  @override
  ConsumerState<ProfileCreateUserPage> createState() =>
      _ProfileCreateUserPageState();
}

class _ProfileCreateUserPageState extends ConsumerState<ProfileCreateUserPage> {
  final TextEditingController _usernameTextController = TextEditingController();
  bool isKeyboardVisible = false;

  bool _isEnableBtn = false;

  void _updateBtnState() {
    setState(() {
      _isEnableBtn = _usernameTextController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _usernameTextController.addListener(_updateBtnState);
    super.initState();
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
                    SizedBox(height: 30.h),
                    _buildTextDescription(),
                    SizedBox(height: 48.h),
                    _buildAvatar(),
                    SizedBox(height: 24.h),
                    _buildTextFieldUsername(),
                    SizedBox(height: 20.h)
                  ],
                ),
              ),
            ),
            _buildBtn(),
          ],
        ),
      ),
    );
  }

  Widget _buildBtn() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 20.h, left: 30.w, right: 30.w),
      child: SecondaryButton(
        backgroundColor:
            _isEnableBtn ? AppColors.crimsonApprox : AppColors.black,
        width: 1.sw,
        height: 50.h,
        title: context.l10n.callMeThis,
        onPressed: _isEnableBtn
            ? () {
                ref
                    .read(signUpViewModelProvider.notifier)
                    .updateUser(nickname: _usernameTextController.text);
                context.pushNamed(AccountCreatePasswordPage.routeName);
              }
            : null,
      ),
    );
  }

  Widget _buildTextDescription() {
    return Text(
      context.l10n.enterYouUsername,
      style: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 23.78.sp,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _buildAvatar() {
    final imagePath =
        ref.read(signUpViewModelProvider.notifier).signupUser?.avatar;
    return SizedBox(
      width: 120.w,
      height: 120.w,
      child: Stack(
        children: [
          Center(
            child: AssetGenImage(
              imagePath ?? Assets.images.profile.profile1.path,
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
                onPressed: () => context.pop(),
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

  Widget _buildTextFieldUsername() {
    return PrimaryTextField(
      options: InputOptions(
        maxLines: 1,
        textInputAction: TextInputAction.done,
        width: 240.w,
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      ),
      backgroundColor: AppColors.white.withOpacity(0.2),
      textStyle: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
      hintText: context.l10n.username,
      controller: _usernameTextController,
      hintStyle: GoogleFonts.inter(
        color: AppColors.white.withOpacity(0.20),
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
      border: InputBorder.none,
    );
  }
}
