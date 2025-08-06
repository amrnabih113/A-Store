
import 'package:flutter/material.dart';

class MyProductPriceText extends StatelessWidget {
  const MyProductPriceText({
    super.key,
    this.currentSign = '\$',
    required this.price,
    this.maxLines,
    this.isLarge = false,
    this.lineTHrough = false,
  });

  final String? currentSign;
  final String price;
  final int? maxLines;
  final bool isLarge;
  final bool lineTHrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currentSign$price',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineTHrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineTHrough ? TextDecoration.lineThrough : null),
    );
  }
}
