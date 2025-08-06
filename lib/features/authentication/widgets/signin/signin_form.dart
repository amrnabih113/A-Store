import 'package:a_store/features/authentication/controllers/signin/signin_controller.dart';
import 'package:a_store/features/authentication/screens/forget_password.dart';
import 'package:a_store/features/authentication/screens/signup.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());
    return Form(
        key: controller.signinFormKey,
        
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: MyDimensions.spaceBetweenSections),
          child: Column(children: [
            TextFormField(
              controller: controller.emailController,
              validator: (value) => MyValidator.validateEmail(value),
              decoration:  InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelText: S.current.email,
              ),
            ),
            const SizedBox(height: MyDimensions.spaceBetweenInputFields),
            Obx(
              () => TextFormField(
                controller: controller.passwordController,
                validator: (value) => MyValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: S.current.password,
                  suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                    onPressed: () {
                      controller.hidePassword.value =
                          !controller.hidePassword.value;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: MyDimensions.spaceBetweenInputFields / 2),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                Obx(
                  () => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) {
                        controller.rememberMe.value = value!;
                      }),
                ),
                Text(
                  S.current.remmberMe,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ]),
              const Spacer(),
              TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: Text(
                    S.current.forgotPassword,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
            ]),
            const SizedBox(height: MyDimensions.spaceBetweenSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signinWithEmailAndPassword(),
                child:  Text(S.current.signIn),
              ),
            ),
            const SizedBox(height: MyDimensions.spaceBetweenItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignupScreen());
                },
                child: Text(S.current.createAccount,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
          ]),
        ));
  }
}
