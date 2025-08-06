import 'package:a_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyRoundedContainer extends StatelessWidget {
  const MyRoundedContainer(
      {super.key,
      this.height,
      this.width,
      this.backgroundColor = Colors.transparent,
      this.radius,
      this.padding = const EdgeInsets.all(0),
      this.child,
      this.margin = const EdgeInsets.all(0),
      this.showBorder = false,
      this.borderColor});
  final double? height;
  final double? width;
  final Color backgroundColor;
  final double? radius;
  final bool showBorder;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget? child;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          border: showBorder
              ? Border.all(color: borderColor ?? MyColors.grey)
              : null,
          borderRadius: BorderRadius.circular(radius ?? 0),
          color: backgroundColor),
      child: child,
    );
  }
}
