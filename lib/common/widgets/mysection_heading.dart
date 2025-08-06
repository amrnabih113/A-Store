import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MySectionHeading extends StatelessWidget {
  const MySectionHeading({
    super.key,
    required this.title,
    this.onPressed,
    this.buttontext,
    this.showActionButton = false,
    this.textColor,
  });

  final String title;
  final VoidCallback? onPressed;
  final String? buttontext;
  final bool showActionButton;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MyHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: textColor ?? (darkMode ? MyColors.white : MyColors.dark)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(darkMode
                      ? MyColors.black.withOpacity(0.5)
                      : MyColors.light.withOpacity(0.5))),
              child: Text(buttontext ?? S.current.viewAll,
                  style: Theme.of(context).textTheme.labelMedium)),
      ],
    );
  }
}
