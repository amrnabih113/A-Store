import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/personalization/controllers/update_name_controller.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:a_store/generated/l10n.dart'; 

class NewNames extends StatelessWidget {
  const NewNames({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(
          S.current.changeName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(MyDimensions.defultSpacing),
              child: Form(
                  key: controller.changeNameFormKey,
                  child: Column(
                    children: [
                      Text(
                        S.current.realNameVerification,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      ItemSeparator.verticalSeparator(),
                      TextFormField(
                        controller: controller.firstNameController,
                        validator: (value) => MyValidator.validateEmptyText(
                            S.current.firstName, value),
                        expands: false,
                        decoration: InputDecoration(
                          labelText: S.current.firstName,
                          prefixIcon: const Icon(Iconsax.user),
                        ),
                      ),
                      ItemSeparator.verticalSeparator(),
                      TextFormField(
                        controller: controller.lastNameController,
                        validator: (value) => MyValidator.validateEmptyText(
                            S.current.lastName, value),
                        expands: false,
                        decoration: InputDecoration(
                          labelText: S.current.lastName,
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
