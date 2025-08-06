import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/widgets/product_card/my_product_price_text.dart';
import 'package:a_store/features/shop/models/cart_item_model.dart';
import 'package:a_store/features/shop/widgets/cart/cart_item.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:a_store/generated/l10n.dart';

class OrderProductContainer extends StatelessWidget {
  const OrderProductContainer({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return MyRoundedContainer(
        radius: 20,
        padding: const EdgeInsets.all(MyDimensions.md),
        margin: const EdgeInsets.symmetric(vertical: MyDimensions.xs),
        showBorder: false,
        borderColor: isDark ? MyColors.darkGrey : MyColors.grey,
        backgroundColor: Colors.transparent,
        width: double.infinity,
        child: Column(
          children: [
            CartItem(
              cartItem: cartItem,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 85,
                    ),
                    Text(S.current.quantityLabel,
                        style: Theme.of(context).textTheme.labelMedium),
                    Text(cartItem.quantity.toString(),
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      S.current.totalPriceLabel,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    MyProductPriceText(
                        price: (cartItem.price * cartItem.quantity)
                            .toStringAsFixed(2),
                        isLarge: false),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

