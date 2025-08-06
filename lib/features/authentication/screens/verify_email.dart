import 'package:a_store/data/repositories/authentication/auth_repository.dart';
import 'package:a_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailSCreen extends StatelessWidget {
  const VerifyEmailSCreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.signOut(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(MyDimensions.defultSpacing),
        child: Column(children: [
          Image.asset(
            MyImages.deliveredEmailIllustration,
            width: MyHelperFunctions.getScreenWidth() * 0.6,
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenSections,
          ),
          Text(
            S.current.confirmEmail,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenItems,
          ),
          Text(
            email ?? " ",
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenSections,
          ),
          Text(
            S.current.confirmEmailSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: MyDimensions.spaceBetweenSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.checkEmailVerifcationStatus(),
                child:  Text(S.current.Continue)),
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenItems,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () => controller.sendEmailVerification(),
                child: Text(
                  S.current.resendEmail,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
          ),
        ]),
      )),
    );
  }
}
