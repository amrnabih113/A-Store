import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/shapes/mycircular_image.dart';
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/brand/mybrand_title_rwith_verification.dart';
import 'package:a_store/common/widgets/product_card/my_product_price_text.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/features/shop/controllers/products/products_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});
  final ProductPackage product;
  @override
  Widget build(BuildContext context) {
    final variedPrice =
        ProductsController.instance.getProductPriceVariation(product.product);
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        children: [
          MyRoundedContainer(
            radius: MyDimensions.sm,
            backgroundColor: MyColors.secondaryColor,
            padding: const EdgeInsets.symmetric(
                horizontal: MyDimensions.sm, vertical: MyDimensions.xs),
            child: Text(
              '${product.product.discountPercentage}%',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: MyColors.black),
            ),
          ),
          if (product.product.discountPercentage > 0 && variedPrice == null)
            ItemSeparator.horizontalSeparator(),
          if (product.product.discountPercentage > 0 && variedPrice == null)
            Text("\$${product.product.price}",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(decoration: TextDecoration.lineThrough)),
          ItemSeparator.horizontalSeparator(),
          MyProductPriceText(
            price: variedPrice ??
                (product.product.price -
                        (product.product.price *
                            product.product.discountPercentage /
                            100))
                    .toStringAsFixed(2),
            isLarge: true,
          )
        ],
      ),
      ItemSeparator.verticalSeparator(),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          product.product.name,
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
        ),
      ),
      Row(children: [
        Text(
          S.current.status,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        ItemSeparator.horizontalSeparator(),
        Text(
          product.product.stock > 0 ? S.current.inStock : S.current.outOfStock,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(color: MyColors.primaryColor),
        ),
      ]),
      ItemSeparator.halfVerticalSeparator(),
      Row(
        children: [
          MycircularImage(
            isNetwokImage: true,
            image: product.brand.image,
            fit: BoxFit.contain,
            padding: 0,
            height: 20,
            width: 30,
          ),
          const SizedBox(width: MyDimensions.xs),
          MyBrandTitleWithVerification(
            title: product.brand.name.toUpperCase(),
            align: SettingsController.instance.isArabic()
                ? Alignment.centerRight
                : Alignment.centerLeft,
          ),
        ],
      ),
    ]);
  }
}
