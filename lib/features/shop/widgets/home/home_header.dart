import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/shapes/curved_edge_widget.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyHomeHeader extends StatelessWidget {
  const MyHomeHeader({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MyCurvedEdgesWidget(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(0),
          color: MyColors.primaryColor,
          child: Stack(children: [
            Positioned(
              top: -150,
              right: -250,
              child: MyRoundedContainer(
                backgroundColor: MyColors.textWhite.withOpacity(0.1),
                radius: 400,
                padding: const EdgeInsets.all(0),
                height: 400,
                width: 400,
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: MyRoundedContainer(
                backgroundColor: MyColors.textWhite.withOpacity(0.1),
                radius: 400,
                padding: const EdgeInsets.all(0),
                height: 400,
                width: 400,
              ),
            ),
            child,
          ]),
        )
      ]),
    );
  }
}
