import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';

class MyGridViweLayout extends StatelessWidget {
  const MyGridViweLayout({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisExtend = 290,
  });
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double mainAxisExtend;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: MyDimensions.gridViewSpacing,
        crossAxisSpacing: MyDimensions.gridViewSpacing,
        mainAxisExtent: mainAxisExtend,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
