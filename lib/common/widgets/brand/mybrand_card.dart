import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/common/shapes/mycircular_image.dart';
import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/brand/mybrand_title_rwith_verification.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyBrandCard extends StatelessWidget {
  const MyBrandCard({
    super.key,
    this.onTap,
    required this.logo,
    required this.title,
    required this.productsCount,
    required this.showBorders,
    this.isNetworkImage = false,
  });

  final VoidCallback? onTap;
  final String logo;
  final String title;
  final String productsCount;
  final bool showBorders;

  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: MyRoundedContainer(
          radius: 20,
          backgroundColor: Colors.transparent,
          showBorder: showBorders,
          padding: const EdgeInsets.only(
              top: MyDimensions.xs,
              bottom: MyDimensions.xs,
              left: MyDimensions.md,
              right: MyDimensions.md),
          child: Row(
            children: [
              Flexible(
                child: MycircularImage(
                  isNetwokImage: isNetworkImage,
                  image: logo,
                  backgroungColor: Colors.transparent,
                  overlayColor: dark ? MyColors.dark : MyColors.white,
                ),
              ),
              ItemSeparator.halfHorizontalSeparator(),
              Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyBrandTitleWithVerification(
                          title: title,
                          align: SettingsController.instance.isArabic()
                              ? Alignment.centerRight
                              : Alignment.centerLeft),
                      Text("$productsCount ${S.current.products}",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium),
                    ]),
              )
            ],
          )),
    );
  }
}
