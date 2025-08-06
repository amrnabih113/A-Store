import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/widgets/brand/mybrand_title_rwith_verification.dart';
import 'package:a_store/common/widgets/my_favourate_icon.dart';
import 'package:a_store/common/widgets/mybanner_container.dart';
import 'package:a_store/common/widgets/product_card/my_product_price_text.dart';
import 'package:a_store/common/widgets/product_card/product_card_vertical.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/features/shop/controllers/products/products_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required this.product});
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
        width: 310,
        height: 130,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyDimensions.productImageRadious),
          color: dark ? MyColors.darkerGrey : MyColors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyRoundedContainer(
              height: 130,
              width: 130,
              padding: const EdgeInsets.all(MyDimensions.sm),
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              radius: MyDimensions.productImageRadious,
              child: Stack(
                children: [
                  MyRoundImageContainer(
                    onTap: () =>
                        Get.to(() => ProductDetailsScreen(product: product)),
                    isNetworkImage: true,
                    image: product.product.images[0],
                    width: double.maxFinite,
                  ),
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
                  Positioned(
                      top: 0,
                      right: 0,
                      child: MyFavouriteIcon(
                        productId: product.product.id,
                      )),
                ],
              ),
            ),
            const SizedBox(width: MyDimensions.sm),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: MyDimensions.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.product.name,
                      style: Theme.of(context).textTheme.labelLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    MyBrandTitleWithVerification(
                      align: SettingsController.instance.isArabic()
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      title: product.brand.name,
                    ),
                    const Spacer(),
                    if (product.product.discountPercentage > 0 &&
                        variedPrice == null)
                      Text(
                        "\$${product.product.price}",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(decoration: TextDecoration.lineThrough),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyProductPriceText(
                          price: variedPrice ??
                              (product.product.price -
                                      (product.product.price *
                                          product.product.discountPercentage /
                                          100))
                                  .toStringAsFixed(2),
                          isLarge: false,
                        ),
                        AddToCartButton(product: product),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
