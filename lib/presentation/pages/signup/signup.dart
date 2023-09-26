import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/di/view_model_provider.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/components/primary_textfield.dart';
import 'package:flutter_movie_clean/presentation/components/secondary_button.dart';
import 'package:flutter_movie_clean/presentation/pages/login/login_page.dart';
import 'package:flutter_movie_clean/presentation/pages/profile/create_avatar/account_create_avatar_page.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_movie_clean/shared/utils/validate_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  static const String routeLocation = "/signup";
  static const String routeName = "signup";

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends ConsumerState<SignupPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObsecureText = true;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _observers();
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 68.h),
              SvgPicture.asset(Assets.images.icLogo.path),
              SizedBox(height: 46.h),
              _buildSignupForm(context),
              SizedBox(height: 24.h),
              _buildSignupButton(context),
              SizedBox(height: 12.h),
              _buildForgotPasswordText(context),
              SizedBox(height: 40.h),
              _buildOrText(context),
              SizedBox(height: 24.h),
              _buildContinueWithText(context),
              SizedBox(height: 20.h),
              _buildSocialButtons(context),
              SizedBox(height: 40.h),
              _buildBottomText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignupForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailInput(context),
          SizedBox(height: 12.h),
          _buildPasswordInput(context),
        ],
      ),
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: PrimaryTextField(
        controller: _emailTextController,
        hintText: context.l10n.emailHint,
        backgroundColor: Colors.white,
        border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
        options:
            InputOptions(maxLines: 1, textInputAction: TextInputAction.next),
        validator: (value) => ValidateHelper.validateEmail(context, value),
      ),
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: PrimaryTextField(
        controller: _passwordTextController,
        hintText: context.l10n.password,
        obscureText: _isObsecureText,
        backgroundColor: Colors.white,
        border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
        options:
            InputOptions(maxLines: 1, textInputAction: TextInputAction.done),
        validator: (value) => ValidateHelper.validatePassword(context, value),
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
      ),
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SecondaryButton(
        title: context.l10n.signup,
        textStyle: TextStyle(fontSize: 18.sp, color: AppColors.white),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ref.read(signupViewModelProvider).signup(
                  email: _emailTextController.text,
                  password: _passwordTextController.text,
                );
          }
        },
      ),
    );
  }

  Widget _buildForgotPasswordText(BuildContext context) {
    return Align(
      alignment: const Alignment(0.8, 0),
      child: RichText(
        text: TextSpan(
            text: context.l10n.forgotPassword,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // TODO: forgot password
              }),
      ),
    );
  }

  Widget _buildOrText(BuildContext context) {
    return Text(
      context.l10n.or,
      style: TextStyle(
        fontSize: 20.sp,
        color: Colors.white54,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildContinueWithText(BuildContext context) {
    return Text(
      context.l10n.continueWith,
      style: TextStyle(
        fontSize: 20.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: const ButtonStyle(
            alignment: Alignment.centerLeft,
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            minimumSize: MaterialStatePropertyAll(Size(140, 50)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.images.facebook.path,
                width: 40.w,
                height: 40.h,
              ),
              SizedBox(width: 10.w),
              Text(
                context.l10n.facebook,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          onPressed: () {
            // TODO: Facebook
          },
        ),
        SizedBox(width: 15.w),
        TextButton(
          style: const ButtonStyle(
            alignment: Alignment.centerLeft,
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            minimumSize: MaterialStatePropertyAll(Size(150, 50)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.images.google.path,
                width: 40.w,
                height: 40.h,
              ),
              SizedBox(width: 10.w),
              Text(
                context.l10n.google,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          onPressed: () {
            // TODO: Google
          },
        ),
      ],
    );
  }

  Widget _buildBottomText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: context.l10n.haveAccount,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white54,
            ),
          ),
          TextSpan(
              text: " ${context.l10n.login}",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.crimsonApprox,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.go(LoginPage.routeLocation)),
        ],
      ),
    );
  }

  _observers() {
    ref.listen(appViewModelProvider, (prevVm, vm) {
      if (vm.account != null) {
        context.go(AccountCreateAvatarPage.routeLocation);
      }
    });

    ref.listen(signupViewModelProvider, (preVm, vm) {
      vm.accountState?.maybeWhen(
          data: (account) {
            if (account != null) {
              ref.read(appViewModelProvider).setAccount(account);
            }
          },
          orElse: () {});
    });
  }
}
