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

class UpdateUserNameController extends GetxController {
  static UpdateUserNameController get instance => Get.find();

  final userNameController = TextEditingController();

  final changeUserNameFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final user = Get.put(UserRepository());

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  void initializeName() {
    userNameController.text = userController.user.value.userName;
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
      if (!changeUserNameFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      Map<String, String> name = {
        "userName": userNameController.text.trim(),
      };
      await user.updateSingleField(name);

      userController.user.value.userName = userNameController.text.trim();
      userController.user.refresh();

      MyFullScreenLoader.stopLoading();

      MyLoaders.successSnackBar(
          title: S.current.congratulations,
          message: S.current.userNameUpdated);
      Get.offUntil(
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
          (route) => route.isFirst);
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
    }
  }
}
