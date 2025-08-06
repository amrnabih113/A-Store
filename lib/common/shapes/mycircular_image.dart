import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MycircularImage extends StatelessWidget {
  const MycircularImage({
    super.key,
    this.height = 58,
    this.width = 58,
    this.padding = MyDimensions.xs,
    this.overlayColor,
    this.backgroungColor,
    this.isNetwokImage = false,
    required this.image,
    this.fit = BoxFit.fitWidth,
  });

  final double height;
  final double width;
  final double padding;
  final Color? overlayColor;
  final Color? backgroungColor;
  final bool isNetwokImage;
  final String image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: dark ? MyColors.dark : MyColors.white),
      padding: EdgeInsets.all(padding),
      child: isNetwokImage
          ? Image.network(
              image,
              height: MyDimensions.md,
              width: MyDimensions.md,
              color: dark ? MyColors.white : MyColors.dark,
              fit: fit,
            )
          : Image.asset(
              image,
              color: dark ? MyColors.light : MyColors.dark,
              fit: fit,
            ),
    );
  }
}
