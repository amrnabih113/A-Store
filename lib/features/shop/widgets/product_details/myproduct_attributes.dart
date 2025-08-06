import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/controllers/products/variation_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/features/shop/widgets/product_details/my_choice_chip.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProductAttributes extends StatelessWidget {
  const MyProductAttributes({super.key, required this.product});

  final ProductPackage product;

  @override
  Widget build(BuildContext context) {
    final VariationController variationController =
        VariationController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: product.product.attributes.map((attribute) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySectionHeading(
              title: attribute.name,
              showActionButton: false,
            ),
            ItemSeparator.halfVerticalSeparator(),
            Obx(
              () => Wrap(
                alignment: WrapAlignment.start,
                spacing: MyDimensions.sm,
                children: attribute.values.map((value) {
                  final isSelected =
                      variationController.selectedAttributes[attribute.name] ==
                          value;
                  final isAvailable = variationController
                      .getAttributeAvailabilityInVariation(
                          product.product.variations, attribute.name)
                      .contains(value);
                  return MyChoiceChip(
                    key: ValueKey(value),
                    text: value,
                    selected: isSelected,
                    onSelected: isAvailable
                        ? (isSelected) {
                            if (isSelected && isAvailable) {
                              variationController.attributeSelected(
                                  product.product, attribute.name, value);
                              CartController.instance
                                  .updateAlreadyAddedCount(product);
                            }
                          }
                        : null,
                  );
                }).toList(),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
