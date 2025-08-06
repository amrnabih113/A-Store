import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyRoundImageContainer extends StatelessWidget {
  const MyRoundImageContainer({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.applyBorderRadious = true,
    this.backGroundColor = Colors.transparent,
    this.fit = BoxFit.contain,
    this.padding = EdgeInsets.zero,
    this.isNetworkImage = false,
    this.onTap,
    this.border,
    this.borderRadious = MyDimensions.md,
  });

  final String image;
  final double? height;
  final double? width;
  final bool applyBorderRadious;
  final Color? backGroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry padding;
  final bool isNetworkImage;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final double borderRadious;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backGroundColor,
          borderRadius: applyBorderRadious
              ? BorderRadius.circular(borderRadious)
              : BorderRadius.zero,
        ),
        child: ClipRRect(
          borderRadius: applyBorderRadious
              ? BorderRadius.circular(borderRadious)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  progressIndicatorBuilder: (_, __, downloadProgress) =>
                      MyShimmerEffect(
                          width: width ?? double.infinity,
                          height: height ?? 158),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                )
              : Image.asset(
                  image,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
