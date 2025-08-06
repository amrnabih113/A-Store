import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/authentication/controllers/signin/reset_pasword_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    return Scaffold(
      appBar: const MyAppBar(
        showBackButton: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(MyDimensions.defultSpacing),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            S.current.forgetPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: MyDimensions.spaceBetweenItems),
          Text(
            S.current.forgetPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: MyDimensions.spaceBetweenSections * 2),
          Form(
            key: controller.resetFormKey,
            child: TextFormField(
              controller: controller.emailController,
              validator: (value) => MyValidator.validateEmail(value),
              decoration:  InputDecoration(
                labelText: S.current.email,
                prefixIcon: const Icon(Iconsax.direct_right),
              ),
            ),
          ),
          const SizedBox(height: MyDimensions.spaceBetweenSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.resetPassword(),
              child:  Text(
                S.current.submit,
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
