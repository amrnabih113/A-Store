import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/personalization/controllers/update_phone_number_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPhoneNumber extends StatelessWidget {
  const EditPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneNumberController());
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(
          S.current.changePhoneNumber,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(MyDimensions.defultSpacing),
              child: Form(
                  key: controller.changePhoneNumberFormKey,
                  child: Column(
                    children: [
                      Text(
                        S.current.enterRealPhoneNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      ItemSeparator.verticalSeparator(),
                      TextFormField(
                        controller: controller.phoneNumberController,
                        validator: (value) =>
                            MyValidator.validatePhoneNumber(value),
                        expands: false,
                        decoration:  InputDecoration(
                          labelText: S.current.phoneNumber,
                          prefixIcon: const Icon(Icons.phone_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: MyDimensions.defultSpacing,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () => controller.updatePhoneNumber(),
                              child:  Text(S.current.save)))
                    ],
                  )))),
    );
  }
}
