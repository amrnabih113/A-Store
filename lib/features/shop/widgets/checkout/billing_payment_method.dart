import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/features/shop/controllers/checkout_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingPaymentMethod extends StatelessWidget {
  const BillingPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Column(children: [
      MySectionHeading(
        title: S.current.paymentMethods,
        showActionButton: true,
        buttontext: S.current.change,
        onPressed: () => checkoutController.selectPaymentMethod(context),
      ),
      ItemSeparator.halfVerticalSeparator(),
      Obx(
        () => Row(children: [
          MyRoundedContainer(
            radius: 10,
            backgroundColor: isDark ? MyColors.light : MyColors.white,
            width: 60,
            height: 35,
            padding: const EdgeInsets.all(MyDimensions.sm),
            child: Image.asset(
              checkoutController.selectedPaymentMethod.value.image,
              fit: BoxFit.contain,
            ),
          ),
          ItemSeparator.horizontalSeparator(),
          Text(
            checkoutController.selectedPaymentMethod.value.name,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ]),
      )
    ]);
  }
}
