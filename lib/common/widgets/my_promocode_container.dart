
import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyPromoCodeContainer extends StatelessWidget {
  const MyPromoCodeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return MyRoundedContainer(
      showBorder: true,
      borderColor: isDark ? MyColors.darkGrey : MyColors.grey,
      radius: 20,
      padding: const EdgeInsets.only(
          top: MyDimensions.sm,
          left: MyDimensions.md,
          right: MyDimensions.sm,
          bottom: MyDimensions.sm),
      child: Row(children: [
        Flexible(
            child: TextFormField(
          decoration:  InputDecoration(
            hintText: S.current.enterPromoCode,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        )),
        SizedBox(
          width: 80,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark
                    ? MyColors.white.withOpacity(0.5)
                    : MyColors.dark.withOpacity(0.5),
                backgroundColor: MyColors.grey.withOpacity(0.6),
                side: BorderSide(color: MyColors.grey.withOpacity(0.6)),
              ),
              child:  Text(S.current.apply, style: Theme.of(context).textTheme.labelMedium,)),
        )
      ]),
    );
  }
}
