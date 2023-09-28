import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/presentation/components/primary_button.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/presentation/pages/main/main_page.dart';
import 'package:flutter_movie_clean/presentation/pages/signup/signup_view_model.dart';
import 'package:flutter_movie_clean/presentation/route/app_router.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountCreateSuccessPage extends ConsumerStatefulWidget {
  const AccountCreateSuccessPage({Key? key}) : super(key: key);

  static const String routeLocation = "/createPinSuccess";
  static const String routeName = "createPinSuccess";

  @override
  ConsumerState<AccountCreateSuccessPage> createState() =>
      _AccountCreateSuccessPageState();
}

class _AccountCreateSuccessPageState
    extends ConsumerState<AccountCreateSuccessPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      signUpViewModelProvider,
      (previous, next) {
        if (next is AsyncData && next.asData != null) {
          print(next.value);
          ref.read(appStateProvider.notifier).loggedIn(next.value);
          context.go(MainPage.routeLocation);
        }
      },
      onError: (error, stackTrace) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      },
    );
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
                    _buildTextDescription(context),
                    SizedBox(height: 62.h),
                    _buildProfileImage(),
                    SizedBox(height: 30.h),
                    _buildTextUsername()
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
      child: PrimaryButton(
        width: 1.sw,
        height: 50.h,
        title: context.l10n.eatYourGreenVegitables,
        onPressed: () {
          ref.read(signUpViewModelProvider.notifier).signUp();
        },
      ),
    );
  }

  Text _buildTextUsername() {
    return Text(
      ref.read(signUpViewModelProvider.notifier).signupUser?.nickname ?? "",
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
          ref.read(signUpViewModelProvider.notifier).signupUser?.avatar ??
              Assets.images.profile.profile1.path,
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
}
