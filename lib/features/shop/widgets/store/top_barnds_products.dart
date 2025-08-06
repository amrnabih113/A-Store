import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BrandTopProductWidget extends StatelessWidget {
  const BrandTopProductWidget({
    super.key,
    required this.image,
    this.height = 100,
    this.margin = const EdgeInsets.only(right: MyDimensions.sm),
  });

  final String image;
  final double height;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Expanded(
      child: MyRoundedContainer(
          radius: 20,
          backgroundColor: dark ? MyColors.darkerGrey : MyColors.light,
          height: height,
          margin: margin,
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.contain,
          )),
    );
  }
}
