import 'package:a_store/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class MyBrandTitle extends StatelessWidget {
  const MyBrandTitle({
    super.key,
    required this.title,
    this.brandTextSize = TextSizes.small,
    this.textcolor,
    this.maxLines = 1,
    this.textAlign,
  });

  final String title;
  final TextSizes brandTextSize;
  final Color? textcolor;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: textcolor)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: textcolor)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: textcolor)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: textcolor),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
