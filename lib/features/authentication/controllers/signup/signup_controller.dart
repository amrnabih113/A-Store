import 'package:a_store/data/repositories/authentication/auth_repository.dart';
import 'package:a_store/data/repositories/user/user_repository.dart';
import 'package:a_store/features/authentication/models/user_model.dart';
import 'package:a_store/features/authentication/screens/verify_email.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/network_manager.dart';
import 'package:a_store/utils/popups/full_screen_loader.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  //
  final RxBool hidePassword = true.obs;
  final RxBool privecyAgreement = false.obs;
  //controllers
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.informationProcessing, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if (!privecyAgreement.value) {
        MyLoaders.warningSnackBar(
            title: S.current.acceptPolicyAndTerms,
            message:
                S.current.acceptPolicyAndTermsMessage);
        MyFullScreenLoader.stopLoading();
        return;
      }

      final UserCredential userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
              emailController.text.trim(), passwordController.text.trim());

      // ignore: unused_local_variable
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: emailController.text.trim(),
        firstName: firstnameController.text.trim(),
        lastName: lastnameController.text.trim(),
        userName: usernameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        profilePictutre:'',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      MyFullScreenLoader.stopLoading();
      Get.to(() => VerifyEmailSCreen(email: emailController.text.trim()));
      MyLoaders.successSnackBar(
          title: S.current.congratulations,
          message:
              S.current.accountCreatedSuccessfully);
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: S.current.errorMessage);
    }
  }
}
