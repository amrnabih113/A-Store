import 'package:a_store/common/widgets/brand/mybrand_title.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyBrandTitleWithVerification extends StatelessWidget {
  const MyBrandTitleWithVerification({
    super.key,
    required this.title,
    this.align = Alignment.center,
    this.textColor,
    this.maxLines = 1,
    this.brandTextSize = TextSizes.medium,
  });
  final String title;
  final Alignment align;
  final Color? textColor;
  final int maxLines;
  final TextSizes? brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Align(
        alignment: align,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: MyBrandTitle(
                title: title,
                brandTextSize: brandTextSize!,
                textcolor: textColor,
                maxLines: maxLines,
              ),
            ),
            const SizedBox(
              width: MyDimensions.xs,
            ),
            const Icon(
              Iconsax.verify5,
              color: MyColors.primaryColor,
              size: MyDimensions.iconXs,
            ),
          ],
        ),
      ),
    );
  }
}
