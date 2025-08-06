import 'package:a_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupTermsCheckbox extends StatelessWidget {
  const SignupTermsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(SignupController());
    return Row(children: [
      Obx(
        () => SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: controller.privecyAgreement.value,
            onChanged: (value) => controller.privecyAgreement.value = value!,
          ),
        ),
      ),
      const SizedBox(
        width: MyDimensions.sm,
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${S.current.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextSpan(
                text: S.current.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium?.apply(
                    decoration: TextDecoration.underline,
                    color: dark ? MyColors.light : MyColors.primaryColor,
                    decorationColor:
                        dark ? MyColors.light : MyColors.primaryColor)),
            TextSpan(
              text: ' ${S.current.and} ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextSpan(
                text: S.current.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium?.apply(
                    decoration: TextDecoration.underline,
                    color: dark ? MyColors.light : MyColors.primaryColor,
                    decorationColor:
                        dark ? MyColors.light : MyColors.primaryColor)),
          ],
        ),
      )
    ]);
  }
}
