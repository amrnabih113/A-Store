import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/common/widgets/product_card/my_product_price_text.dart';
import 'package:a_store/features/shop/controllers/products/variation_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductVariation extends StatelessWidget {
  const ProductVariation({super.key, required this.product});
  final ProductPackage product;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final variationController = Get.put(VariationController());
    return Obx(() {
      variationController.getProductVariationStockStatus();
      return variationController.selectedVariation.value.attributeValues
              .toJson()
              .isNotEmpty
          ? Column(
              children: [
                MyRoundedContainer(
                    padding: const EdgeInsets.all(MyDimensions.md),
                    radius: MyDimensions.md,
                    backgroundColor: dark ? MyColors.darkerGrey : MyColors.grey,
                    child: Column(
                      children: [
                        Row(children: [
                          MySectionHeading(
                            title: S.current.variation,
                          ),
                          ItemSeparator.horizontalSeparator(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${S.current.price} :",
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  ItemSeparator.halfHorizontalSeparator(),
                                  Text(
                                    "\$${variationController.selectedVariation.value.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                  ItemSeparator.halfHorizontalSeparator(),
                                  MyProductPriceText(
                                      price:
                                          "${variationController.selectedVariation.value.price - product.product.discountPercentage * variationController.selectedVariation.value.price / 100}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${S.current.status} :",
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  ItemSeparator.halfHorizontalSeparator(),
                                  Text(
                                      variationController
                                          .variationStockStatus.value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .apply(color: MyColors.primaryColor)),
                                ],
                              ),
                            ],
                          ),
                        ]),
                        // for description in product.product.attributes
                        // Text(
                        //   "",
                        //   maxLines: 4,
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .labelSmall!
                        //       .copyWith(fontWeight: FontWeight.w800),
                        // )
                      ],
                    )),
              ],
            )
          : const SizedBox.shrink();
    });
  }
}

