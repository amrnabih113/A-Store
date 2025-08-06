import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/mycircular_icon.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyBottomAddToCart extends StatelessWidget {
  const MyBottomAddToCart({super.key, required this.product});
  final ProductPackage product;

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    final CartController cartController = CartController.instance;
    
    return Obx(
      () => Container(
          padding: const EdgeInsets.symmetric(
              horizontal: MyDimensions.defultSpacing),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              color: isDark ? MyColors.darkerGrey : MyColors.light,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(MyDimensions.cardRadiusLg),
                  topRight: Radius.circular(MyDimensions.cardRadiusLg))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: MyCircularIcon(
                    icon: Iconsax.minus,
                    color: isDark ? MyColors.white : MyColors.dark,
                    backgroungColor:
                        isDark ? MyColors.darkGrey : MyColors.white,
                    onPressed: () =>
                        cartController.productQuantityInCart.value < 1
                            ? null
                            : cartController.productQuantityInCart.value--,
                  ),
                ),
                ItemSeparator.halfHorizontalSeparator(),
                MyRoundedContainer(
                  child: Text(
                    cartController.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                ItemSeparator.halfHorizontalSeparator(),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: MyCircularIcon(
                    icon: Iconsax.add,
                    color: isDark ? MyColors.white : MyColors.white,
                    backgroungColor: MyColors.black,
                    onPressed: () =>
                        cartController.productQuantityInCart.value++,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => cartController.productQuantityInCart < 1
                  ? null
                  : cartController.addToCart(product),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(MyDimensions.md),
                  backgroundColor: MyColors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(MyDimensions.cardRadiusLg))),
              child: Row(
                children: [
                  const Icon(Iconsax.shopping_bag, color: MyColors.white),
                  ItemSeparator.halfHorizontalSeparator(),
                  Text(
                    S.current.addToBag,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: MyColors.white),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
