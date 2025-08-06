import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyRatingAndShare extends StatelessWidget {
  final double rating;
  final int totalRating;
  final VoidCallback? onShareTap;

  const MyRatingAndShare({
    super.key,
    required this.rating,
    required this.totalRating,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: MyColors.secondaryColor,
            ),
            const SizedBox(width: MyDimensions.sm),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: rating.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: MyColors.secondaryColor,
                        fontWeightDelta: 3,
                      )),
              TextSpan(
                  text: ' ( $totalRating )',
                  style: Theme.of(context).textTheme.bodySmall),
            ])),
          ],
        ),
        IconButton(
          onPressed: onShareTap,
          icon: const Icon(Icons.share),
        ),
      ],
    );
  }
}
