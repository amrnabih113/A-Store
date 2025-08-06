import 'package:a_store/common/widgets/mybanner_container.dart';
import 'package:a_store/features/personalization/screens/payments/cards_screen.dart';
import 'package:a_store/features/shop/models/payment_method_model.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethodModel paymentMethod;

  const PaymentMethodTile({
    super.key,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return ListTile(
      minTileHeight: 80,
      leading: MyRoundImageContainer(
          image: paymentMethod.image,
          isNetworkImage: false,
          width: 40,
          height: 40,
          backGroundColor: isDark ? MyColors.light : MyColors.white,
          padding: const EdgeInsets.all(MyDimensions.sm),
          fit: BoxFit.contain),
      title: Text(
        paymentMethod.name,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: const Icon(Iconsax.arrow_right_34),
      onTap: () => Get.to(() => MyCards(
            paymentMethod: paymentMethod,
          )),
    );
  }
}
