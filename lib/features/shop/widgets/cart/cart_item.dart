import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/brand/mybrand_title_rwith_verification.dart';
import 'package:a_store/common/widgets/mybanner_container.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/features/shop/models/cart_item_model.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyRoundImageContainer(
          isNetworkImage: true,
          image: cartItem.image ?? "",
          width: 70,
          height: 70,
          backGroundColor: isDark ? MyColors.darkGrey : MyColors.grey,
          padding: const EdgeInsets.all(MyDimensions.xs),
          fit: BoxFit.contain,
        ),
        ItemSeparator.horizontalSeparator(),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyBrandTitleWithVerification(
                title: cartItem.brandName ?? "",
                textColor: isDark ? MyColors.white : MyColors.darkGrey,
                align: SettingsController.instance.isArabic()
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
              ),
              Flexible(
                child: Text(
                  cartItem.title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text.rich(TextSpan(
                children:
                    (cartItem.selectedVariation ?? {}).entries.map((entry) {
                  return TextSpan(children: [
                    TextSpan(
                      text: " ${entry.key}: ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: entry.value,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ]);
                }).toList(),
              )),
              ItemSeparator.verticalSeparator(),
            ],
          ),
        ),
      ],
    );
  }
}
