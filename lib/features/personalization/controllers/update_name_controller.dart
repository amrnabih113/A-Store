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

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final changeNameFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final user = Get.put(UserRepository());

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  void initializeNames() {
    firstNameController.text = userController.user.value.firstName;
    lastNameController.text = userController.user.value.lastName;
  }

  void updateUserName() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.requestProcessing, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      if (!changeNameFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      Map<String, String> names = {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim()
      };
      await user.updateSingleField(names);

      userController.user.value.firstName = firstNameController.text.trim();
      userController.user.value.lastName = lastNameController.text.trim();
      userController.user.refresh();

      MyFullScreenLoader.stopLoading();

      MyLoaders.successSnackBar(
          title:S.current.congratulations, message: S.current.nameUpdated);
      Get.offUntil(
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
          (route) => route.isFirst);
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
    }
  }
}
