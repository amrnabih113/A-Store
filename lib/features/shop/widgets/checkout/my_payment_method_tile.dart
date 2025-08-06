import 'package:a_store/common/widgets/mybanner_container.dart';
import 'package:a_store/features/shop/controllers/checkout_controller.dart';
import 'package:a_store/features/shop/models/payment_method_model.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyPaymentMethodTile extends StatelessWidget {
  final PaymentMethodModel paymentMethod;

  const MyPaymentMethodTile({
    super.key,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final isDark = MyHelperFunctions.isDarkMode(context);
    return ListTile(
      leading: MyRoundImageContainer(
          image: paymentMethod.image,
          isNetworkImage: false,
          width: 40,
          height: 40,
          backGroundColor: isDark ? MyColors.light : MyColors.white,
          padding: const EdgeInsets.all(MyDimensions.sm),
          fit: BoxFit.contain),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
    );
  }
}
