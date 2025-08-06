import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';

class ItemSeparator {
  static Widget verticalSeparator() {
    return const SizedBox(
      height: MyDimensions.spaceBetweenItems,
    );
  }

  static Widget horizontalSeparator() {
    return const SizedBox(
      width: MyDimensions.spaceBetweenItems,
    );
  }

  static Widget halfVerticalSeparator() {
    return const SizedBox(
      height: MyDimensions.spaceBetweenItems / 2,
    );
  }

  static Widget halfHorizontalSeparator() {
    return const SizedBox(
      width: MyDimensions.spaceBetweenItems / 2,
    );
  }
}
