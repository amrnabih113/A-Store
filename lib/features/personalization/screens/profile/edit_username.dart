import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/personalization/controllers/update_username_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditUserName extends StatelessWidget {
  const EditUserName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUserNameController());
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(
          S.current.changeUserName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(MyDimensions.defultSpacing),
              child: Form(
                  key: controller.changeUserNameFormKey,
                  child: Column(
                    children: [
                      Text(
                        S.current.changeUserNameMessage,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      ItemSeparator.verticalSeparator(),
                      TextFormField(
                        controller: controller.userNameController,
                        validator: (value) =>
                            MyValidator.validateEmptyText(S.current.userName, value),
                        expands: false,
                        decoration:  InputDecoration(
                          labelText: S.current.userName,
                          prefixIcon: const Icon(Iconsax.user),
                        ),
                      ),
                      const SizedBox(
                        height: MyDimensions.defultSpacing,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () => controller.updateUserName(),
                              child: Text(S.current.save)))
                    ],
                  )))),
    );
  }
}
