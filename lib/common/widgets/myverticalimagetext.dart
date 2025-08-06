import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyVerticalImageText extends StatelessWidget {
  const MyVerticalImageText({
    super.key,
    required this.title,
    required this.image,
    this.textColor = MyColors.white,
    this.backGroundColor,
    this.onTap,
  });

  final String title;
  final String image;
  final Color textColor;
  final Color? backGroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var darkMode = MyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MyDimensions.spaceBetweenItems),
        child: Column(children: [
          Container(
            height: 56,
            width: 56,
            padding: const EdgeInsets.all(MyDimensions.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: backGroundColor ??
                  (MyHelperFunctions.isDarkMode(context)
                      ? MyColors.dark
                      : MyColors.white),
            ),
            child: Image.network(
              image,
              color: backGroundColor ??
                  (darkMode ? MyColors.white : MyColors.dark),
            ),
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenItems / 2,
          ),
          Text(
            title,
            style:
                Theme.of(context).textTheme.bodyMedium!.apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ]),
      ),
    );
  }
}
