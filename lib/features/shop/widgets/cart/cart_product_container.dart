import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/widgets/my_product_item_conter.dart';
import 'package:a_store/common/widgets/product_card/my_product_price_text.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/models/cart_item_model.dart';
import 'package:a_store/features/shop/widgets/cart/cart_item.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartProductContainer extends StatelessWidget {
  const CartProductContainer(
      {super.key, this.showConter = true, required this.cartItem});
  final bool showConter;
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
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
            if (showConter)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyProductItemCounter(
                    quantity: cartItem.quantity,
                    plusOnPressed: () => cartController.addOneToCart(cartItem),
                    minusOnPressed: () =>
                        cartController.removeOneFromCart(cartItem),
                  ),
                  MyProductPriceText(
                      price: (cartItem.price * cartItem.quantity)
                          .toStringAsFixed(2),
                      isLarge: true),
                ],
              )
          ],
        ));
  }
}
