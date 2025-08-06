import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/personalization/controllers/user_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(S.current.reAuthenticationUser,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(MyDimensions.defultSpacing),
        child: Form(
            key: userController.reAuthFormKey,
            child: Column(children: [
              TextFormField(
                controller: userController.authEmailController,
                validator: (value) => MyValidator.validateEmail(value),
                decoration:  InputDecoration(
                  labelText: S.current.email,
                  prefixIcon: const Icon(Iconsax.direct_right),
                ),
              ),
              ItemSeparator.verticalSeparator(),
              Obx(
                () => TextFormField(
                  controller: userController.authPasswordController,
                  validator: (value) => MyValidator.validatePassword(value),
                  obscureText: userController.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: S.current.password,
                    prefixIcon: const Icon(Iconsax.lock),
                    suffixIcon: IconButton(
                      icon: userController.hidePassword.value
                          ? const Icon(Iconsax.eye_slash)
                          : const Icon(Iconsax.eye),
                      onPressed: () {
                        userController.hidePassword.value =
                            !userController.hidePassword.value;
                      },
                    ),
                  ),
                ),
              ),
              ItemSeparator.verticalSeparator(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>
                        userController.reAuthanticateWithEmailAndPassword(),
                    child:  Text(S.current.verify)),
              )
            ])),
      )),
    );
  }
}
