import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyProfileMenuTile extends StatelessWidget {
  final String title;
  final String data;
  final VoidCallback onTap;
  final IconData? icon;

  const MyProfileMenuTile({
    super.key,
    required this.title,
    required this.data,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MyDimensions.sm),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(title,
                    style: Theme.of(context).textTheme.labelMedium)),
            Expanded(
                flex: 6,
                child:
                    Text(data, style: Theme.of(context).textTheme.bodyMedium)),
            Icon(
              icon ??
                  (SettingsController.instance.isArabic()
                      ? Iconsax.arrow_left_2
                      : Iconsax.arrow_right_3),
              color: dark ? MyColors.white : MyColors.dark,
              size: MyDimensions.iconMd,
            ),
          ],
        ),
      ),
    );
  }
}
