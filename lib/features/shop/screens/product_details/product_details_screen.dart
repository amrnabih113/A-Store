import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/my_read_more_text.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/controllers/products/variation_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/features/shop/screens/cart/cart_screen.dart';
import 'package:a_store/features/shop/screens/reviews/reviews_screen.dart';
import 'package:a_store/features/shop/widgets/product_details/mybottom_addtocart.dart';
import 'package:a_store/features/shop/widgets/product_details/myproduct_attributes.dart';
import 'package:a_store/features/shop/widgets/product_details/myproduct_image_slider.dart';
import 'package:a_store/features/shop/widgets/product_details/myratingandshare.dart';
import 'package:a_store/features/shop/widgets/product_details/product_meta_data.dart';
import 'package:a_store/features/shop/widgets/product_details/product_variation.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductPackage product;
  @override
  Widget build(BuildContext context) {
    final VariationController variationController =
        Get.put(VariationController());
    variationController.resetSelectedAttributes();
    CartController.instance.updateAlreadyAddedCount(product);
    return Scaffold(
      bottomNavigationBar: MyBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(children: [
          MyProductImageSlider(
            product: product,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: MyDimensions.defultSpacing,
                right: MyDimensions.defultSpacing,
                bottom: MyDimensions.defultSpacing),
            child: Column(
              children: [
                const MyRatingAndShare(
                  rating: 5,
                  totalRating: 50,
                ),
                ProductMetaData(
                  product: product,
                ),
                if (product.product.isVariable)
                  ItemSeparator.verticalSeparator(),
                if (product.product.isVariable)
                  ProductVariation(product: product),
                if (product.product.attributes.isNotEmpty)
                  MyProductAttributes(product: product),
                ItemSeparator.verticalSeparator(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        CartController.instance.addToCart(product);
                        if (CartController
                                        .instance.productQuantityInCart.value >
                                    0 &&
                                product.product.isVariable &&
                                variationController
                                    .selectedVariation.value.id.isNotEmpty ||
                            !product.product.isVariable &&
                                CartController
                                        .instance.productQuantityInCart.value >
                                    0) {
                          Get.to(() => const CartScreen());
                        }
                      },
                      child: Text(
                        S.current.checkout,
                      )),
                ),
                ItemSeparator.verticalSeparator(),
                MySectionHeading(title: S.current.description),
                ItemSeparator.halfVerticalSeparator(),
                MyReadMoreText(
                  text: product.product.description,
                ),
                const Divider(),
                ItemSeparator.verticalSeparator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MySectionHeading(title: "${S.current.reviews} (199)"),
                    IconButton(
                        onPressed: () => Get.to(() => const ReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3))
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
