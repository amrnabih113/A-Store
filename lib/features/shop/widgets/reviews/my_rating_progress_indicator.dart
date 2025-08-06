
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyRatingProgressIndicator extends StatelessWidget {
  const MyRatingProgressIndicator({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '${value * 5}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        ItemSeparator.halfHorizontalSeparator(),
        Expanded(
          flex: 10,
          child: SizedBox(
            width: MyHelperFunctions.getScreenWidth() * 0.8,
            child: LinearProgressIndicator(
              minHeight: 10,
              value: value,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(MyColors.primaryColor),
              backgroundColor: MyColors.grey,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }
}
