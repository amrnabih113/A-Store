import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/features/shop/models/order_model.dart';
import 'package:a_store/features/shop/widgets/orders/order_product_container.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:a_store/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final orderItems = order.mappedItems;
    final subTotal = order.mappedItems
        .fold<double>(0, (sum, item) => sum + (item.price * item.quantity));
    final shippingFee =
        MyPricingCalculator.calculateShippingCost(subTotal, "USA");
    final taxFee = MyPricingCalculator.calculateTax(subTotal, "USA");
    final isDark = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(S.current.order_details,
            style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MyDimensions.defultSpacing),
          child: Column(children: [
            Row(
              children: [
                Text(
                  "${S.current.order_number} #${order.id}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                Text(
                  order.status,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: MyColors.primaryColor, fontWeightDelta: 1),
                ),
              ],
            ),
            ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                return OrderProductContainer(
                  cartItem: orderItems[index],
                );
              },
            ),
            MyRoundedContainer(
              padding: const EdgeInsets.all(MyDimensions.md),
              radius: 20,
              showBorder: true,
              backgroundColor: isDark ? MyColors.black : MyColors.white,
              child: Column(children: [
                Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        "\$${order.totalAmount.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ]),
                ItemSeparator.verticalSeparator(),
                const Divider(),
                ItemSeparator.verticalSeparator(),
                MySectionHeading(
                  title: S.current.payment_method,
                  showActionButton: false,
                ),
                ItemSeparator.verticalSeparator(),
                Row(children: [
                  MyRoundedContainer(
                    radius: 10,
                    backgroundColor: isDark ? MyColors.light : MyColors.white,
                    width: 60,
                    height: 35,
                    padding: const EdgeInsets.all(MyDimensions.sm),
                    child: Image.asset(
                      MyImages.paymentMethod,
                      fit: BoxFit.contain,
                    ),
                  ),
                  ItemSeparator.horizontalSeparator(),
                  Text(
                    order.paymentMethod,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ]),
                ItemSeparator.verticalSeparator(),
                const Divider(),
                ItemSeparator.verticalSeparator(),
                MySectionHeading(
                  title: S.current.shipping_address,
                  showActionButton: false,
                ),
                ItemSeparator.halfVerticalSeparator(),
                Row(children: [
                  const Icon(
                    Iconsax.location5,
                    color: MyColors.grey,
                    size: MyDimensions.iconMd,
                  ),
                  ItemSeparator.horizontalSeparator(),
                  Flexible(
                    child: Text(
                      order.shippingAddress,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ]),
                ItemSeparator.verticalSeparator(),
                const Divider(),
                ItemSeparator.verticalSeparator(),
                MySectionHeading(
                  title: S.current.notes,
                  showActionButton: false,
                ),
                ItemSeparator.verticalSeparator(),
                Text(
                  order.notes ?? S.current.no_notes,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                ItemSeparator.verticalSeparator(),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
