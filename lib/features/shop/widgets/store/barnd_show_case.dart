import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/widgets/brand/mybrand_card.dart';
import 'package:a_store/features/shop/widgets/store/top_barnds_products.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class MyBrandShowCase extends StatelessWidget {
  const MyBrandShowCase({
    super.key,
    required this.logo,
    required this.title,
    required this.productsCount,
    this.height = 100,
    this.margin = const EdgeInsets.only(bottom: MyDimensions.spaceBetweenItems),
    required this.topProducts,
    this.onTap,
    this.isNetworkImage = false,
    this.isLoading = false,
  });

  final String logo;
  final String title;
  final String productsCount;
  final double height;
  final EdgeInsets margin;
  final VoidCallback? onTap;
  final List<String> topProducts;
  final bool isNetworkImage;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyRoundedContainer(
        padding: const EdgeInsets.all(MyDimensions.md),
        radius: 20,
        showBorder: true,
        borderColor: MyColors.darkGrey,
        margin: margin,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          MyBrandCard(
            isNetworkImage: isNetworkImage,
            showBorders: false,
            logo: logo,
            title: title,
            productsCount: productsCount,
          ),
          isLoading!
              ? Row(children: [
                  for (int i = 0; i < 3; i++)
                    const MyShimmerEffect(width: 80, height: 80)
                ])
              : Row(children: [
                  for (int i = 0; i < topProducts.length; i++)
                    BrandTopProductWidget(
                      image: topProducts[i],
                    )
                ])
        ]),
      ),
    );
  }
}
