import 'package:a_store/common/styles/sectionseparator.dart';
import 'package:a_store/features/shop/models/product_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  Rx<String> selectedImage = ''.obs;
  List<String> getProductImages(ProductModel product) {
    Set<String> images = {};
    selectedImage.value = product.images[0];
    images.addAll(product.images);
    if (product.variations.isNotEmpty) {
      images.addAll(product.variations.map((variation) => variation.image));
    }
    return images.toList();
  }

  void showEnlargeImage(String image, {bool isNetworkImage = true}) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: MyDimensions.defultSpacing * 2,
                        horizontal: MyDimensions.defultSpacing),
                    child: isNetworkImage
                        ? CachedNetworkImage(imageUrl: image)
                        : Image.asset(image),
                  ),
                  Sectionseparator.verticalSeparator(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: Text(S.current.close,
                              style:
                                  Theme.of(Get.context!).textTheme.titleSmall)),
                    ),
                  )
                ],
              ),
            ));
  }
}
