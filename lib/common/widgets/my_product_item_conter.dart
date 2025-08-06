import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/mycircular_icon.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyProductItemCounter extends StatelessWidget {
  const MyProductItemCounter({
    super.key,
    this.height = 35,
    this.width = 35,
    this.plusColor = MyColors.primaryColor,
    this.minusColor = MyColors.grey,
    this.plusOnPressed,
    this.minusOnPressed,
    this.iconSize = 20,
    this.preSpaceWidth = 82, required this.quantity,

  });

  final double height;
  final double width;
  final Color plusColor;
  final Color minusColor;
  final VoidCallback? plusOnPressed;
  final VoidCallback? minusOnPressed;
  final double iconSize;
  final double preSpaceWidth;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Row(children: [
      SizedBox(
        width: preSpaceWidth,
      ),
      MyCircularIcon(
        icon: Iconsax.minus,
        height: height,
        width: width,
        size: iconSize,
        backgroungColor: isDark ? MyColors.darkGrey : minusColor,
        onPressed: minusOnPressed,
      ),
      ItemSeparator.horizontalSeparator(),
      Text(
        quantity.toString(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      ItemSeparator.horizontalSeparator(),
      MyCircularIcon(
        icon: Iconsax.add,
        height: height,
        width: width,
        size: iconSize,
        backgroungColor: plusColor,
        onPressed: plusOnPressed,
      ),
    ]);
  }
}
