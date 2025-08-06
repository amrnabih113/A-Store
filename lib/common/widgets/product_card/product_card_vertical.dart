import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/styles/shadow_styles.dart';
import 'package:a_store/common/widgets/my_favourate_icon.dart';
import 'package:a_store/common/widgets/mybanner_container.dart';
import 'package:a_store/common/widgets/product_card/my_product_price_text.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/controllers/products/products_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});
  final ProductPackage product;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    final String? variedPrice =
        ProductsController.instance.getProductPriceVariation(product.product);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(
            product: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [MyShadowStyles.verticalProductShadow],
          borderRadius: BorderRadius.circular(MyDimensions.productImageRadious),
          color: dark ? MyColors.darkerGrey : MyColors.white,
        ),
        child: Column(children: [
          MyRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(MyDimensions.sm),
            backgroundColor: dark ? MyColors.dark : MyColors.light,
            radius: MyDimensions.productImageRadious,
            child: Stack(
              children: [
                //product image
                MyRoundImageContainer(
                  isNetworkImage: true,
                  onTap: () => Get.to(() => ProductDetailsScreen(
                        product: product,
                      )),
                  image: product.product.images[0],
                  width: double.maxFinite,
                ),

                //sale tag
                if (product.product.discountPercentage > 0)
                  Positioned(
                    top: 12,
                    left: 0,
                    child: MyRoundedContainer(
                      radius: MyDimensions.sm,
                      backgroundColor: MyColors.secondaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: MyDimensions.sm,
                          vertical: MyDimensions.xs),
                      child: Text(
                        '${product.product.discountPercentage}%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: MyColors.black),
                      ),
                    ),
                  ),

                // wishlist icon
                Positioned(
                    top: 0,
                    right: 0,
                    child: MyFavouriteIcon(
                      productId: product.product.id,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenItems / 2,
          ),
          // details
          Padding(
            padding: const EdgeInsets.only(left: MyDimensions.sm),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.product.name,
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: MyDimensions.spaceBetweenItems / 2,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        product.brand.name,
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        width: MyDimensions.xs,
                      ),
                      const Icon(
                        Iconsax.verify5,
                        color: MyColors.primaryColor,
                        size: MyDimensions.iconXs,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              if (product.product.discountPercentage > 0 && variedPrice == null)
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: MyDimensions.sm),
                    child: Text("\$${product.product.price}",
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(decoration: TextDecoration.lineThrough)),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: MyDimensions.sm),
                    child: MyProductPriceText(
                      price: variedPrice ??
                          (product.product.price -
                                  (product.product.price *
                                      product.product.discountPercentage /
                                      100))
                              .toStringAsFixed(2),
                      isLarge: false,
                    ),
                  ),
                  AddToCartButton(product: product)
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final ProductPackage product;

  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final settingsController = SettingsController.instance;
    final cartController = Get.put(CartController());
    return InkWell(
      onTap: () {
        // Add your add to cart logic here
        if (!product.product.isVariable) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailsScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product);

        return Container(
          padding: const EdgeInsets.all(MyDimensions.sm),
          decoration: BoxDecoration(
            borderRadius: settingsController.isArabic()
                ? const BorderRadius.only(
                    topRight: Radius.circular(MyDimensions.cardRadiusMd),
                    bottomLeft:
                        Radius.circular(MyDimensions.productImageRadious),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(MyDimensions.cardRadiusMd),
                    bottomRight:
                        Radius.circular(MyDimensions.productImageRadious),
                  ),
            color: productQuantityInCart > 0
                ? MyColors.primaryColor
                : MyColors.dark,
          ),
          child: SizedBox(
            width: MyDimensions.iconLg,
            height: MyDimensions.iconLg,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: MyColors.white),
                    )
                  : const Icon(Iconsax.add, color: MyColors.white),
            ),
          ),
        );
      }),
    );
  }
}
