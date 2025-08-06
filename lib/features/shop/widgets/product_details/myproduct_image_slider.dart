import 'package:a_store/common/shapes/curved_edge_widget.dart';
import 'package:a_store/common/widgets/my_favourate_icon.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mybanner_container.dart';
import 'package:a_store/features/shop/controllers/products/images_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProductImageSlider extends StatelessWidget {
  final ProductPackage product;
  final double height;
  final double thumbnailHeight;
  final double thumbnailWidth;
  final double borderRadius;
  final Color borderColor;
  final int currentIndex;

  const MyProductImageSlider({
    super.key,
    this.height = 400.0,
    required this.product,
    this.thumbnailHeight = 80.0,
    this.thumbnailWidth = 80.0,
    this.borderRadius = 10.0,
    this.borderColor = MyColors.primaryColor,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final imagesController = Get.put(ImagesController());
    final imageList = imagesController.getProductImages(product.product);
    return MyCurvedEdgesWidget(
      child: Container(
        color: dark ? MyColors.black : MyColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(MyDimensions.defultSpacing * 2),
                child: Center(child: Obx(() {
                  final selectedImage = imagesController.selectedImage.value;
                  return GestureDetector(
                    onTap: () =>
                        imagesController.showEnlargeImage(selectedImage),
                    child: CachedNetworkImage(
                      imageUrl: selectedImage,
                      fit: BoxFit.contain,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  );
                })),
              ),
            ),
            Positioned(
              bottom: 30,
              right: MyDimensions.defultSpacing,
              left: MyDimensions.defultSpacing,
              child: SizedBox(
                height: thumbnailHeight,
                child: Obx(() {
                  final selectedImage = imagesController.selectedImage.value;

                  return ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: imageList.length,
                    separatorBuilder: (_, __) => const SizedBox(
                      width: MyDimensions.md,
                    ),
                    itemBuilder: (_, index) => MyRoundImageContainer(
                      onTap: () {
                        imagesController.selectedImage.value = imageList[index];
                      },
                      isNetworkImage: true,
                      backGroundColor: dark ? MyColors.dark : MyColors.white,
                      image: imageList[index],
                      borderRadious: borderRadius,
                      applyBorderRadious: true,
                      width: thumbnailWidth,
                      height: thumbnailHeight,
                      border: Border.all(
                          color: selectedImage == imageList[index]
                              ? borderColor
                              : Colors.transparent),
                      padding: const EdgeInsets.all(MyDimensions.sm),
                    ),
                  );
                }),
              ),
            ),
            MyAppBar(
              showBackButton: true,
              actions: [
                MyFavouriteIcon(
                  productId: product.product.id,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
