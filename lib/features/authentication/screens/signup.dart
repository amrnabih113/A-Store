import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/myform_divider.dart';
import 'package:a_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:a_store/features/authentication/widgets/signup/signup_form.dart';
import 'package:a_store/features/authentication/widgets/signup/signup_terms_checkbox.dart';
import 'package:a_store/features/authentication/widgets/socialbuttons.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: const MyAppBar(
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MyDimensions.defultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: MyDimensions.spaceBetweenSections,
              ),
              const SignupForm(),
              const SignupTermsCheckbox(),
              const SizedBox(height: MyDimensions.spaceBetweenSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child:  Text(S.current.createAccount),
                ),
              ),
              const SizedBox(height: MyDimensions.spaceBetweenSections),
              MyFormDivider(deviderText: S.current.orsignUpWith.toUpperCase()),
              const SizedBox(height: MyDimensions.spaceBetweenSections),
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
