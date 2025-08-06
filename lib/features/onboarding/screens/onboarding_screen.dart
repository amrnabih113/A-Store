import 'package:a_store/features/onboarding/widgets/onboarding_button.dart';
import 'package:a_store/features/onboarding/widgets/onboarding_indicator.dart';
import 'package:a_store/features/onboarding/widgets/onboarding_pages.dart';
import 'package:a_store/features/onboarding/widgets/onboarding_skip_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        OnBoardingPages(),
        const OnBoardingSkipButton(),
        const OnBoardingIndicator(),
        const OnBoardingButton(),
      ],
    ));
  }
}
