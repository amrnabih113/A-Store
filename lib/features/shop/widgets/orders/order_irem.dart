import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/features/shop/models/order_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.order,
  });
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return MyRoundedContainer(
        padding: const EdgeInsets.all(MyDimensions.md),
        radius: 20,
        showBorder: true,
        borderColor: isDark ? MyColors.white : MyColors.grey,
        backgroundColor: isDark ? MyColors.black : MyColors.light,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Icon(
                Iconsax.ship,
                color: isDark ? MyColors.white : MyColors.black,
              ),
              ItemSeparator.halfHorizontalSeparator(),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  order.status,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: MyColors.primaryColor, fontWeightDelta: 1),
                ),
                Text(
                  DateFormat('dd MMM, yyyy').format(order.orderDate),
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ]),
            ]),
            Icon(
              Iconsax.arrow_right_3,
              color: isDark ? MyColors.white : MyColors.black,
              size: MyDimensions.iconMd,
            )
          ]),
          ItemSeparator.halfVerticalSeparator(),
          Row(children: [
            Expanded(
              child: Row(children: [
                Icon(
                  Iconsax.tag,
                  color: isDark ? MyColors.white : MyColors.black,
                ),
                ItemSeparator.halfHorizontalSeparator(),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(S.current.order, style: Theme.of(context).textTheme.labelMedium),
                  Text(
                    '#${order.id.toString()}',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ]),
              ]),
            ),
            Expanded(
              child: Row(children: [
                Icon(
                  Iconsax.calendar,
                  color: isDark ? MyColors.white : MyColors.black,
                ),
                ItemSeparator.halfHorizontalSeparator(),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(S.current.shippingDate,
                      style: Theme.of(context).textTheme.labelMedium),
                  Text(
                    order.shippingDate != null
                        ? DateFormat('dd MMM, yyyy').format(order.shippingDate!)
                        : S.current.notSet,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ]),
              ]),
            )
          ])
        ]));
  }
}
