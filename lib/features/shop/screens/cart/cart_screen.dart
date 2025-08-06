import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/widgets/cart/cart_items.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/navigation_menu.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkout/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: MyDimensions.md,
            top: 0,
            left: MyDimensions.md,
            right: MyDimensions.md),
        child: controller.cartItems.isNotEmpty
            ? ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() => Text(
                    "${S.current.checkout} \$${controller.totalCartPrice.toStringAsFixed(2)}")),
              )
            : null,
      ),
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(
          S.current.cart,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        MyAnimationLoaderWidget emptyWidget = MyAnimationLoaderWidget(
          text: '',
          animation: '',
          actionText: '',
          onActionPressed: () {},
        );
        if (controller.cartItems.isEmpty) {
          emptyWidget = MyAnimationLoaderWidget(
            text: S.current.cartEmpty,
            animation: MyImages.addingProductInCartAnimation,
            actionText: S.current.fillCart,
            showAction: true,
            onActionPressed: () => Get.offAll(() => const NavigationMenu()),
          );
        }
        return controller.cartItems.isEmpty
            ? emptyWidget
            : const Padding(
                padding: EdgeInsets.all(MyDimensions.defultSpacing),
                child: CartItems(
                  showCounter: true,
                  scroll: true,
                ));
      }),
    );
  }
}
