import 'package:a_store/features/authentication/controllers/signin/signin_controller.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: MyColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.signInWithGoogle(),
            icon: Image.asset(
              MyImages.google,
              width: MyDimensions.iconMd,
              height: MyDimensions.iconMd,
            ),
          ),
        ),
        const SizedBox(width: MyDimensions.spaceBetweenItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: MyColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              MyImages.facebook,
              width: MyDimensions.iconLg,
              height: MyDimensions.iconLg,
            ),
          ),
        )
      ],
    );
  }
}
