import 'package:a_store/features/onboarding/controllers/onboarding_controller.dart';
import 'package:a_store/features/onboarding/models/onboarding_repo.dart';
import 'package:a_store/features/onboarding/models/onboardingmodel.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPages extends StatelessWidget {
  OnBoardingPages({super.key});
  final List<MyOnBoardingModel> onBoardingItems =
      MyOnBoardingRepo().getOnBoardingList();
  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: controller.updatePageIndicator,
        itemCount: onBoardingItems.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(MyDimensions.defultSpacing),
            child: Column(children: [
              Image.asset(
                onBoardingItems[index].image!,
                key: ValueKey(onBoardingItems[index].image),
                height: MyHelperFunctions.getScreenHeight() * 0.6,
                width: MyHelperFunctions.getScreenWidth() * 0.8,
              ),
              Text(onBoardingItems[index].title!,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MyDimensions.spaceBetweenItems),
              Text(onBoardingItems[index].subtitle!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
            ]),
          );
        });
  }
}
