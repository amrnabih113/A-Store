
import 'package:a_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class MyStarRatingIndicator extends StatelessWidget {
  final double rating;
  final int itemCount;
  final double itemSize;
  final Color unratedColor;
  final Color ratedColor;

  const MyStarRatingIndicator({
    super.key,
    required this.rating,
    this.itemCount = 5,
    this.itemSize = 20,
    this.unratedColor = Colors.grey,
    this.ratedColor = MyColors.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemCount: itemCount,
        itemSize: itemSize,
        unratedColor: unratedColor,
        itemBuilder: (_, __) => Icon(
              Iconsax.star1,
              color: ratedColor,
            ));
  }
}
