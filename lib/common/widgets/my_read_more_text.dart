
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class MyReadMoreText extends StatelessWidget {
  final String text;
  final int trimLines;
  final Color moreColor;
  final Color lessColor;

  const MyReadMoreText({
    required this.text,
    this.trimLines = 2,
    this.moreColor = MyColors.primaryColor,
    this.lessColor = MyColors.secondaryColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: trimLines,
      colorClickableText: moreColor,
      trimMode: TrimMode.Line,
      trimCollapsedText: S.current.showMore,
      trimExpandedText: S.current.showLess,
      moreStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: moreColor),
      lessStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: lessColor),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
