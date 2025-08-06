import 'dart:async';

import 'package:a_store/data/repositories/authentication/auth_repository.dart';
import 'package:a_store/features/authentication/screens/success_screen.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.emailVerification();
      MyLoaders.successSnackBar(
          title: S.current.emailSentTitle,
          message: S.current.emailSentSubTitle);
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: S.current.errorMessage);
    }
  }

  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: MyImages.checkRegisterAnimation,
              title: S.current.yourAccountCreatedTitle,
              subtitle: S.current.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  checkEmailVerifcationStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      Get.off(() => SuccessScreen(
            image: MyImages.checkRegisterAnimation,
            title: S.current.yourAccountCreatedTitle,
            subtitle: S.current.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
