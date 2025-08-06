import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/my_read_more_text.dart';
import 'package:a_store/features/shop/widgets/reviews/my_star_rating_indicator.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Container(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(MyImages.userProfileImage2),
                    ),
                    ItemSeparator.horizontalSeparator(),
                    Text(
                      'Kareem Hassan',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            ItemSeparator.verticalSeparator(),
            Row(children: [
              const MyStarRatingIndicator(
                rating: 4,
                ratedColor: MyColors.primaryColor,
              ),
              ItemSeparator.halfHorizontalSeparator(),
              Text(
                '01 Nov 2024',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ]),
            ItemSeparator.verticalSeparator(),
            const MyReadMoreText(
                trimLines: 1,
                text:
                    'the user interface of the app is quite amazing, i was able to navigate and buy what i want seamlessly. great app!'),
            ItemSeparator.verticalSeparator(),
            MyRoundedContainer(
                radius: 20,
                backgroundColor: isDark ? MyColors.darkerGrey : MyColors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(MyDimensions.md),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "A'store",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                '02 Nov 2024',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ]),
                        ItemSeparator.verticalSeparator(),
                        const MyReadMoreText(
                          text:
                              'the user interface of the app is quite amazing, i was able to navigate and buy what i want seamlessly. great app! ,thank you',
                          trimLines: 2,
                        )
                      ]),
                ))
          ],
        ));
  }
}
