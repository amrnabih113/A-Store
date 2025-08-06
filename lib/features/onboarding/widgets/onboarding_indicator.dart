import 'package:a_store/features/onboarding/controllers/onboarding_controller.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/device/device_utility.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final bool dark = MyHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: MyDeviceUtils.getBottomNavigationBarHeight(context) + 25,
      left: MyDimensions.defultSpacing,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: (index) => controller.dotNavigationClick(index),
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? MyColors.light : MyColors.dark,
          dotHeight: 6,
        ),
        count: 3,
      ),
    );
  }
}
