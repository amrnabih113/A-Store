import 'package:a_store/common/shapes/curve_edges.dart';
import 'package:flutter/material.dart';

class MyCurvedEdgesWidget extends StatelessWidget {
  const MyCurvedEdgesWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCurveEdges(),
      child: child,
    );
  }
}
