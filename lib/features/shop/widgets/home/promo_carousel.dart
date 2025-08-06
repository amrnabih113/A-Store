import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/mybanner_container.dart';
import 'package:a_store/features/shop/controllers/banners_controller.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoCarousel extends StatelessWidget {
  const PromoCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannersController());

    final dark = MyHelperFunctions.isDarkMode(context);
    return Obx(() {
      final banners = controller.activeBanners;
      if (controller.isLoading.value) {
        return const MyShimmerEffect(width: double.infinity, height: 190);
      }
      return Column(
        children: [
          CarouselSlider(
              items: banners
                  .map((banner) => MyRoundImageContainer(
                        image: banner.imageUrl,
                        isNetworkImage: true,
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, _) {
                  controller.updatePageIndicator(index);
                },
              )),
          ItemSeparator.verticalSeparator(),
          Obx(
            () => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (int i = 0; i < banners.length; i++)
                MyRoundedContainer(
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carouselCurrentIndex.value == i
                      ? MyColors.primaryColor
                      : dark
                          ? MyColors.light
                          : MyColors.dark,
                  radius: 5,
                  padding: const EdgeInsets.all(0),
                  height: 4,
                  width: 20,
                )
            ]),
          )
        ],
      );
    });
  }
}
