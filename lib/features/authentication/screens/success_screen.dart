import 'package:a_store/common/styles/spacing_styles.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.onPressed, required this.title, required this.subtitle});
  final String image;
  final VoidCallback onPressed;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: MySpacingStyles.paddingWithAppBarHeight * 2,
      child: Column(
        children: [
          //image
          Lottie.asset(
            image,
            width: MyHelperFunctions.getScreenWidth() * 0.6,
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenSections,
          ),

          //title and subtitle
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenSections,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: MyDimensions.spaceBetweenSections),

          // button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: onPressed, child:  Text(S.current.Continue)),
          ),
          const SizedBox(
            height: MyDimensions.spaceBetweenItems,
          ),
        ],
      ),
    )));
  }
}
