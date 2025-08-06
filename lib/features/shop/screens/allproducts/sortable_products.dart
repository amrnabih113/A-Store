import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/mygridviw_layout.dart';
import 'package:a_store/common/widgets/product_card/product_card_vertical.dart';
import 'package:a_store/features/shop/controllers/products/all_products_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
    required this.products,
  });
  final List<ProductPackage> products;
  @override
  Widget build(BuildContext context) {
    final allProductController = AllProductController.instance;
    allProductController.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              for (var item in [
                S.current.name,
                S.current.priceHighToLow,
                S.current.priceLowToHigh,
                S.current.sale,
                S.current.newest
              ])
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
            ],
            value: allProductController.selectedSortOption.value,
            onChanged: (value) => allProductController.sortProducts(value!)),
        ItemSeparator.verticalSeparator(),
        Obx(() {
          final products = allProductController.products;
          return MyGridViweLayout(
              itemBuilder: (context, index) {
                return ProductCardVertical(
                  product: products[index],
                );
              },
              itemCount: products.length);
        })
      ],
    );
  }
}
