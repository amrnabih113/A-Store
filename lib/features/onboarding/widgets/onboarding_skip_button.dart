import 'package:a_store/features/onboarding/controllers/onboarding_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MyDeviceUtils.getAppBarHeight(),
        right: MyDimensions.defultSpacing,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: Text(S.current.skip, style: Theme.of(context).textTheme.bodyMedium),
        ));
  }
}
