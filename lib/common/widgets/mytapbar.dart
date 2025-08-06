import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyTapBar extends StatelessWidget implements PreferredSizeWidget {
  const MyTapBar({
    super.key,
    required this.tabs,
    this.indicatorColor = MyColors.primaryColor,
    this.unSelectedColor = MyColors.darkGrey,
  });

  final List<Widget> tabs;
  final Color indicatorColor;
  final Color unSelectedColor;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Material(
        color: dark ? MyColors.dark : MyColors.white,
        child: TabBar(
          isScrollable: true,
          indicatorColor: indicatorColor,
          unselectedLabelColor: unSelectedColor,
          labelColor: dark ? MyColors.white : MyColors.primaryColor,
          tabAlignment: TabAlignment.start,
          tabs: tabs,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
