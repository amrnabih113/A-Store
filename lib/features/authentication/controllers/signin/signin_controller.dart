import 'package:a_store/data/repositories/authentication/auth_repository.dart';
import 'package:a_store/features/personalization/controllers/user_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/constants/texts.dart';
import 'package:a_store/utils/helpers/network_manager.dart';
import 'package:a_store/utils/popups/full_screen_loader.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  final RxBool hidePassword = true.obs;
  final RxBool rememberMe = false.obs;
  final GetStorage localStorage = GetStorage();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signinFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    emailController.text = localStorage.read(MyTexts.rememberMeEmail) ?? "";
    passwordController.text =
        localStorage.read(MyTexts.rememberMePassword) ?? "";
    super.onInit();
  }

  void signinWithEmailAndPassword() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.loggingIn, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if (!signinFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      if (!rememberMe.value) {
        localStorage.write(
            MyTexts.rememberMeEmail, emailController.text.trim());
        localStorage.write(
            MyTexts.rememberMePassword, passwordController.text.trim());
      }

      await AuthenticationRepository.instance.signInWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());

      MyFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: S.current.errorMessage);
    }
  }

  void signInWithGoogle() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.loggingIn, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      UserCredential userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredential);

      MyFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: S.current.errorMessage);
    }
  }
}
