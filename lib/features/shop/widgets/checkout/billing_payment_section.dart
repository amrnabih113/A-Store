import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final shippingFee =
        MyPricingCalculator.calculateShippingCost(subTotal, "USA");
    final taxFee = MyPricingCalculator.calculateTax(subTotal, "USA");
    final total = MyPricingCalculator.calculateTotalPrice(subTotal, "USA");
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          S.current.subtotal,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          "\$${subTotal.toStringAsFixed(2)}",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ]),
      ItemSeparator.halfVerticalSeparator(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.current.shipping_fee,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "\$$shippingFee",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
      ItemSeparator.halfVerticalSeparator(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.current.tax_fee,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "\$$taxFee",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
      ItemSeparator.halfVerticalSeparator(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.current.order_total,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "\$${total.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      )
    ]);
  }
}
