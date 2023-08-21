import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/components/primary_button.dart';
import 'package:flutter_movie_clean/components/secondary_button.dart';
import 'package:flutter_movie_clean/gen/assets.gen.dart';
import 'package:flutter_movie_clean/gen/colors.gen.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeForeground extends StatelessWidget {
  const WelcomeForeground({
    this.isLastItem = false,
    this.btnContinueClicked,
    this.description = "",
    this.pageCount = 0,
    this.pageController,
    super.key,
  });

  final bool isLastItem;
  final String description;
  final Function()? btnContinueClicked;
  final int pageCount;
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 6,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: IgnorePointer(
              child: Container(
                padding: const EdgeInsets.fromLTRB(7.74, 12.09, 6.22, 10.81),
                color: AppColors.crimsonApprox,
                width: 188.23.w,
                child: Assets.images.icLogo.svg(fit: BoxFit.contain),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 68,
        ),
        Flexible(
          flex: 1,
          child: IgnorePointer(
            child: SmoothPageIndicator(
              controller: pageController ?? PageController(),
              count: pageCount,
              effect: WormEffect(
                dotHeight: 10.w,
                dotWidth: 10.w,
                activeDotColor: AppColors.crimsonApprox,
                type: WormType.underground,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 52,
        ),
        Flexible(
          flex: 5,
          child: isLastItem
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: PrimaryButton(
                          title: context.l10n.signup,
                          onPressed: () {
                            //TODO GO TO SIGNUP
                          }),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: SecondaryButton(
                          title: context.l10n.login,
                          onPressed: () {
                            //TODO GO TO LOGIN
                          }),
                    )
                  ],
                )
              : Column(
                  children: [
                    IgnorePointer(
                      child: Text(
                        description,
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 30.w, right: 30.w, bottom: 40.h),
                        alignment: Alignment.bottomCenter,
                        child: PrimaryButton(
                          width: 1.sw,
                          height: 50.h,
                          title: context.l10n.continueStr,
                          onPressed: btnContinueClicked,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
