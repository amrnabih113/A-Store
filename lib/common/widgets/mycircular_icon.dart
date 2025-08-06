import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyCircularIcon extends StatelessWidget {
  const MyCircularIcon({
    super.key,
    required this.icon,
    this.height,
    this.width,
    this.size = MyDimensions.iconLg,
    this.color,
    this.backgroungColor,
    this.onPressed,
  });

  final IconData icon;
  final double? height;
  final double? width;
  final double? size;
  final Color? color;
  final Color? backgroungColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroungColor ??
            (dark
                ? MyColors.black.withOpacity(0.8)
                : MyColors.white.withOpacity(0.8)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: size, color: color ?? MyColors.white),
      ),
    );
  }
}
