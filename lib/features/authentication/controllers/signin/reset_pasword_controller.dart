import 'package:a_store/data/repositories/authentication/auth_repository.dart';
import 'package:a_store/features/authentication/screens/reset_password.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/network_manager.dart';
import 'package:a_store/utils/popups/full_screen_loader.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance => Get.find();

  final emailController = TextEditingController();
  final resetFormKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.requestProcessing, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if (!resetFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .resetPassword(emailController.text.trim());
      MyLoaders.successSnackBar(
          title: S.current.emailSentTitle,
          message: S.current.resetPasswordEmail);
      MyFullScreenLoader.stopLoading();
      Get.to(() => ResetPassword(
            email: emailController.text.trim(),
          ));
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
          title: S.current.ohSnap, message: S.current.errorMessage);
    }
  }

  resendPasswordEmailReset() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.requestProcessing, MyImages.docerAnimation);
      await AuthenticationRepository.instance
          .resetPassword(emailController.text.trim());
      MyLoaders.successSnackBar(
          title: S.current.emailSentTitle,
          message: S.current.resetPasswordEmail);
      MyFullScreenLoader.stopLoading();
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
          title: S.current.ohSnap, message: S.current.errorMessage);
    }
  }
}
