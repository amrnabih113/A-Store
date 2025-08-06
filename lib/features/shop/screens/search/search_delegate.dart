import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/product_card/product_card_horizontal.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MySearchDelegate extends SearchDelegate {
  final List<ProductPackage> data;

  MySearchDelegate({required this.data});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: SettingsController.instance.isArabic()
          ? const Icon(Iconsax.arrow_right_3)
          : const Icon(Iconsax.arrow_left_2),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = data
        .where((item) =>
            item.product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(MyDimensions.defultSpacing),
      child: ListView.separated(
        separatorBuilder: (context, index) => ItemSeparator.verticalSeparator(),
        itemCount: results.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Get.to(() => ProductDetailsScreen(product: results[index]));
              },
              child: ProductCardHorizontal(product: results[index]));
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = data
        .where((item) =>
            item.product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(MyDimensions.defultSpacing),
      child: ListView.separated(
        separatorBuilder: (context, index) => ItemSeparator.verticalSeparator(),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                query = suggestions[index].product.name;
                showResults(context);
              },
              child: ProductCardHorizontal(product: suggestions[index]));
        },
      ),
    );
  }
}
