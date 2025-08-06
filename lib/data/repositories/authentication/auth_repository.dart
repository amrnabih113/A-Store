import 'package:a_store/data/repositories/user/user_repository.dart';
import 'package:a_store/features/authentication/screens/signin.dart';
import 'package:a_store/features/authentication/screens/verify_email.dart';
import 'package:a_store/features/onboarding/screens/onboarding_screen.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/navigation_menu.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/texts.dart';
import 'package:a_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:a_store/utils/exceptions/firebase_exceptions.dart';
import 'package:a_store/utils/exceptions/format_exceptions.dart';
import 'package:a_store/utils/exceptions/platform_exceptions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:a_store/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

    final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        await MyLocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailSCreen(
              email: user.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull(MyTexts.isFirstTime, true);
      deviceStorage.read(MyTexts.isFirstTime) != true
          ? Get.offAll(() => const SigninScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> emailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    }catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> signOut() async {
    try {
      Get.defaultDialog(
        contentPadding: const EdgeInsets.all(MyDimensions.md),
        buttonColor: MyColors.primaryColor,
        title: S.current.loggingOut,
        titlePadding: const EdgeInsets.all(MyDimensions.md),
        textConfirm: S.current.logOut,
        textCancel: S.current.cancel,
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.white,
        backgroundColor: MyHelperFunctions.isDarkMode(Get.context!)
            ? MyColors.black
            : MyColors.light,
        middleText: S.current.logOutMessage,
        onConfirm: () async {
          await _auth.signOut();
          await GoogleSignIn().signOut();
          Get.offAll(() => const SigninScreen());
          deviceStorage.write(MyTexts.rememberMeEmail, null);
          deviceStorage.write(MyTexts.rememberMePassword, null);
        },
        onCancel: () => Navigator.of(Get.overlayContext!).pop(),
      );
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.deleteUserRecord(currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }
}
