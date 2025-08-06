import 'package:a_store/features/authentication/screens/signin.dart';
import 'package:a_store/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  final currentIndex = 0.obs;

  // update current index
  void updatePageIndicator(int index) => currentIndex.value = index;

  //jumb to the specified page
  void dotNavigationClick(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(currentIndex.value);
  }

  //jump to the next page
  void nextPage() {
    if (currentIndex.value == 2) {
      GetStorage().write(MyTexts.isFirstTime, false);
      Get.to(() => const SigninScreen());
    }
    currentIndex.value = currentIndex.value + 1;
    pageController.jumpToPage(currentIndex.value);
  }

  //jumb to last page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(currentIndex.value);
  }
}
