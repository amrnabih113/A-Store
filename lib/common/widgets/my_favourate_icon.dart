import 'package:a_store/common/widgets/mycircular_icon.dart';
import 'package:a_store/features/shop/controllers/favourite_controller.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyFavouriteIcon extends StatelessWidget {
  const MyFavouriteIcon({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    final dark = MyHelperFunctions.isDarkMode(context);
    return Obx(() {
      return MyCircularIcon(
        onPressed: () => controller.toggleFavourite(productId),
        icon:
            controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId)
            ? Colors.red
            : dark
                ? Colors.white
                : Colors.black,
      );
    });
  }
}
