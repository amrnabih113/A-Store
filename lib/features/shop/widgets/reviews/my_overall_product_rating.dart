import 'package:a_store/features/shop/widgets/reviews/my_rating_progress_indicator.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';

class MyOverallProductRating extends StatelessWidget {
  const MyOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              '4.5',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              double value = [1.0, 0.8, 0.6, 0.4, 0.2][index];
              return Column(
                children: [
                  MyRatingProgressIndicator(value: value),
                  const SizedBox(height: MyDimensions.xs),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
