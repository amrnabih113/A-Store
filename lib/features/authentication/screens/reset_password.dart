import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/authentication/controllers/signin/reset_pasword_controller.dart';
import 'package:a_store/features/authentication/screens/signin.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = ResetPasswordController.instance;
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(MyDimensions.defultSpacing),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //image
          Image.asset(
            MyImages.deliveredEmailIllustration,
            width: MyHelperFunctions.getScreenWidth() * 0.6,
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenSections,
          ),
          Text(
            email,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenSections,
          ),
          //title and subtitle
          Text(
            S.current.changeYourPasswordTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox( 
            height: MyDimensions.spaceBetweenSections,
          ),
          Text(
            S.current.changeYourPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: MyDimensions.spaceBetweenSections),

          // button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.offAll(() => const SigninScreen()),
                child:  Text(S.current.done)),
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenItems,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () => controller.resendPasswordEmailReset(),
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
