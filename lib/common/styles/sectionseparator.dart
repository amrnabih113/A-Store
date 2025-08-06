import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';

class Sectionseparator {
  static Widget verticalSeparator() {
    return const SizedBox(
      height: MyDimensions.spaceBetweenSections,
    );
  }

  static Widget horizontalSeparator() {
    return const SizedBox(
      width: MyDimensions.spaceBetweenItems,
    );
  }
}
