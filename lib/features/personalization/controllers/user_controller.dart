import 'package:a_store/data/repositories/authentication/auth_repository.dart';
import 'package:a_store/data/repositories/user/user_repository.dart';
import 'package:a_store/features/authentication/models/user_model.dart';
import 'package:a_store/features/authentication/screens/signin.dart';
import 'package:a_store/features/authentication/widgets/signin/re_auth_login_form.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/network_manager.dart';
import 'package:a_store/utils/popups/full_screen_loader.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<bool> profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());

  final hidePassword = true.obs;
  final authEmailController = TextEditingController();
  final authPasswordController = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();

  Rx<bool> imageLoading = false.obs;

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  Future<void> saveUserRecord(UserCredential? user) async {
    try {
      if (user != null) {
        final nameParts = UserModel.nameParts(user.user!.displayName!);
        final username = UserModel.generateUsername(user.user!.displayName!);
        final userModel = UserModel(
          id: user.user!.uid,
          email: user.user!.email!,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : "",
          userName: username,
          phoneNumber: user.user!.phoneNumber ?? "",
          profilePictutre: "",
        );

        await userRepository.saveUserRecord(userModel);
      }
    } catch (e) {
      MyLoaders.errorSnackBar(
          title: S.current.dataNotSaved,
          message:
              S.current.errorMessage);
    }
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading(true);
      final user = await UserRepository.instance.fetchUserDetails();
      this.user(user);
      profileLoading(false);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(MyDimensions.md),
      title: S.current.deleteAccount,
      middleText:
          S.current.deleteAccountMessage,
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: MyDimensions.lg),
          child: Text(S.current.delete),
        ),
      ),
      cancel: OutlinedButton(
        child:  Text(S.current.cancel),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  Future<void> deleteUserAccount() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.requestProcessing, MyImages.docerAnimation);

      final auth = AuthenticationRepository.instance;

      final provider =
          auth.currentUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          MyFullScreenLoader.stopLoading();
          Get.offAll(() => const SigninScreen());
        } else if (provider == 'password') {
          MyFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.warningSnackBar(title: S.current.ohSnap, message: e.toString());
    }
  }

  Future<void> reAuthanticateWithEmailAndPassword() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.requestProcessing, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(authEmailController.text.trim(),
              authPasswordController.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      MyFullScreenLoader.stopLoading();
      Get.offAll(
        () => const SigninScreen(),
      );
      MyLoaders.successSnackBar(
          title: S.current.success, message: S.current.accountDeletedSuccessfully);
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.warningSnackBar(title: S.current.ohSnap, message: e.toString());
    }
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    MyLoaders.successSnackBar(title: S.current.copied, message: S.current.copiedToClipboard);
  }

  Future<void> uploadUserProfilePicture() async {
    try {
      imageLoading.value = true;
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 500,
      );
      if (image != null) {
        final url = await UserRepository.instance
            .uploadImage("${image.name}.png", image);
        await UserRepository.instance.updateSingleField({
          "profilePictutre": url,
        });
        user.value.profilePictutre = url;
        user.refresh();
        imageLoading.value = false;
        MyLoaders.successSnackBar(
          title: S.current.success,
          message: S.current.profilePictureUpdatedSuccessfully,
        );
      }
      imageLoading.value = false;
    } catch (e) {
      imageLoading.value = false;
      MyLoaders.warningSnackBar(
          title: S.current.ohSnap, message: S.current.errorMessage);
    }
  }
}
