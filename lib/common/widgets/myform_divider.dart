import 'package:a_store/utils/constants/colors.dart';

import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyFormDivider extends StatelessWidget {
  const MyFormDivider({super.key, required this.deviderText});

  final String deviderText;
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(
        child: Divider(
          color: dark ? MyColors.darkGrey : MyColors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        ), 
      ),
      Text(
        deviderText,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      Flexible(
        child: Divider(
          color: dark ? MyColors.darkGrey : MyColors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        ),
      )
    ]);
  }
}
