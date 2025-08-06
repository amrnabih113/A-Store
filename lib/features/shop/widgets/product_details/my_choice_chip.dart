import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyChoiceChip extends StatelessWidget {
  const MyChoiceChip(
      {super.key,
      required this.text,
      required this.selected,
      required this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final bool isColor = MyHelperFunctions.getColor(text.toLowerCase()) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor
            ? const SizedBox()
            : Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
        selected: selected,
        onSelected: onSelected,
        selectedColor:
            isColor ? MyHelperFunctions.getColor(text.toLowerCase()) : null,
        labelStyle: TextStyle(color: selected ? MyColors.white : null),
        avatar: isColor
            ? const MyRoundedContainer(
                width: 50,
                height: 50,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: MyHelperFunctions.getColor(text.toLowerCase()),
      ),
    );
  }
}
