import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/my_promocode_container.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/controllers/orders_controller.dart';
import 'package:a_store/features/shop/widgets/cart/cart_items.dart';
import 'package:a_store/features/shop/widgets/checkout/billing_address_section.dart';
import 'package:a_store/features/shop/widgets/checkout/billing_payment_method.dart';
import 'package:a_store/features/shop/widgets/checkout/billing_payment_section.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:a_store/utils/helpers/pricing_calculator.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    final subtotal = MyPricingCalculator.calculateTotalPrice(
        controller.totalCartPrice.value, "USA");
    final orderController = Get.put(OrdersController());
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(MyDimensions.defultSpacing),
        child: Column(children: [
          const CartItems(
            showCounter: false,
          ),
          const MyPromoCodeContainer(),
          ItemSeparator.verticalSeparator(),
          MyRoundedContainer(
            padding: const EdgeInsets.all(MyDimensions.md),
            radius: 20,
            showBorder: true,
            backgroundColor: isDark ? MyColors.black : MyColors.white,
            child: Column(children: [
              const BillingPaymentSection(),
              ItemSeparator.verticalSeparator(),
              const Divider(),
              ItemSeparator.verticalSeparator(),
              const BillingPaymentMethod(),
              ItemSeparator.verticalSeparator(),
              const Divider(),
              ItemSeparator.verticalSeparator(),
              const BillingAddressSection(),
            ]),
          ),
        ]),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: MyDimensions.md,
            top: 0,
            left: MyDimensions.md,
            right: MyDimensions.md),
        child: ElevatedButton(
            onPressed: controller.totalCartPrice.value > 0
                ? () => orderController.processOrder()
                : MyLoaders.warningSnackBar(
                    title: S.current.emptyCart, message: S.current.addItems),
            child: Text("${S.current.checkout} \$ ${subtotal.toStringAsFixed(2)}")),
      ),
    );
  }
}
