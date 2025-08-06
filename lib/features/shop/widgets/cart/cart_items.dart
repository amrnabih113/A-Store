import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/widgets/cart/cart_product_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  final bool showCounter;
  final bool scroll;

  const CartItems({
    super.key,
    this.showCounter = true,
    this.scroll = false,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(() {
      return ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        
        shrinkWrap: true,
        physics: scroll
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: cartController.cartItems.length,
        itemBuilder: (context, index) {
          return CartProductContainer(
            showConter: showCounter,
            cartItem: cartController.cartItems[index],
          );
        },
      );
    });
  }
}
