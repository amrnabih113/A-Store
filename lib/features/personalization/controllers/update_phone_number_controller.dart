import 'package:a_store/data/repositories/user/user_repository.dart';
import 'package:a_store/features/personalization/controllers/user_controller.dart';
import 'package:a_store/features/personalization/screens/profile/profile_screen.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/network_manager.dart';
import 'package:a_store/utils/popups/full_screen_loader.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePhoneNumberController extends GetxController {
  static UpdatePhoneNumberController get instance => Get.find();

  final phoneNumberController = TextEditingController();

  final changePhoneNumberFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final user = Get.put(UserRepository());

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  void initializeName() {
    phoneNumberController.text = userController.user.value.phoneNumber;
  }

  void updatePhoneNumber() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.requestProcessing, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      if (!changePhoneNumberFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      Map<String, String> name = {
        "phoneNumber": phoneNumberController.text.trim(),
      };
      await user.updateSingleField(name);

      userController.user.value.phoneNumber = phoneNumberController.text.trim();
      userController.user.refresh();

      MyFullScreenLoader.stopLoading();

      MyLoaders.successSnackBar(
          title: S.current.congratulations,
          message: S.current.phoneUpdated);
      Get.offUntil(
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
          (route) => route.isFirst);
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
    }
  }
}
