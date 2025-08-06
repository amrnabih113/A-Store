import 'package:a_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstnameController,
                  validator: (value) =>
                      MyValidator.validateEmptyText(S.current.firstName, value),
                  decoration:  InputDecoration(
                    labelText: S.current.firstName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: MyDimensions.spaceBetweenInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastnameController,
                  validator: (value) =>
                      MyValidator.validateEmptyText(S.current.lastName, value),
                  decoration:  InputDecoration(
                    labelText: S.current.lastName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenInputFields,
          ),
          TextFormField(
            controller: controller.usernameController,
            validator: (value) =>
                MyValidator.validateEmptyText(S.current.userName, value),
            decoration:  InputDecoration(
              labelText: S.current.userName,
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenInputFields,
          ),
          TextFormField(
            controller: controller.emailController,
            validator: (value) => MyValidator.validateEmail(value),
            decoration:  InputDecoration(
              labelText: S.current.email,
              prefixIcon: const Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenInputFields,
          ),
          TextFormField(
            controller: controller.phoneNumberController,
            validator: (value) => MyValidator.validatePhoneNumber(value),
            decoration:  InputDecoration(
              labelText: S.current.phoneNumber,
              prefixIcon: const Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenInputFields,
          ),
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.passwordController,
              validator: (value) => MyValidator.validatePassword(value),
              decoration: InputDecoration(
                labelText: S.current.password,
                prefixIcon: const Icon(Iconsax.password_check),
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
          const SizedBox(height: MyDimensions.spaceBetweenInputFields),
        ],
      ),
    );
  }
}
