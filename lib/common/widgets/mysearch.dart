// ignore_for_file: use_build_context_synchronously

import 'package:a_store/features/shop/controllers/products/all_products_controller.dart';
import 'package:a_store/features/shop/screens/search/search_delegate.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/device/device_utility.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MySearchContainer extends StatelessWidget {
  const MySearchContainer({
    super.key,
    this.showBackGround = true,
    required this.text,
    this.icon,
    this.showBorder = true,
    this.padding,
  });
  final bool showBackGround;
  final bool showBorder;
  final EdgeInsetsGeometry? padding;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final productController = AllProductController.instance;
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: MyDimensions.defultSpacing),
      child: InkWell(
        onTap: () async {
          final products = await productController.fetchAllProducts();
          showSearch(
            context: context,
            delegate: MySearchDelegate(
                data: products),
          );
        },
        child: Container(
          width: MyDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(MyDimensions.md),
          decoration: BoxDecoration(
              color: showBackGround
                  ? dark
                      ? MyColors.dark
                      : MyColors.white
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(MyDimensions.cardRadiusLg),
              border: showBorder
                  ? Border.all(
                      color: dark ? MyColors.darkerGrey : MyColors.grey,
                    )
                  : null),
          child: Row(children: [
            Icon(icon, color: dark ? MyColors.grey : MyColors.darkGrey),
            const SizedBox(width: MyDimensions.spaceBetweenItems),
            Text(text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: dark ? MyColors.grey : MyColors.darkGrey)),
          ]),
        ),
      ),
    );
  }
}
