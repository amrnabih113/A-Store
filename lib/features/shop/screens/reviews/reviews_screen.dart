import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/shop/widgets/reviews/my_overall_product_rating.dart';
import 'package:a_store/features/shop/widgets/reviews/my_star_rating_indicator.dart';
import 'package:a_store/features/shop/widgets/reviews/user_review_card.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(S.current.reviews_and_ratings,
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MyDimensions.defultSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.ratings_and_reviews_message,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              ItemSeparator.verticalSeparator(),
              const MyOverallProductRating(),
              const MyStarRatingIndicator(rating: 4.5),
              ItemSeparator.verticalSeparator(),
              const UserReviewCard(),
              ItemSeparator.verticalSeparator(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
