import 'package:a_store/common/styles/spacing_styles.dart';
import 'package:a_store/features/authentication/widgets/signin/signin_form.dart';
import 'package:a_store/common/widgets/myform_divider.dart';
import 'package:a_store/features/authentication/widgets/socialbuttons.dart';
import 'package:a_store/features/authentication/widgets/signin/signin_header.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  MySpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              Image.asset(MyImages.appLogo,
                  height: MyHelperFunctions.getScreenHeight() * 0.2),
              const SigninHeader(),
              const SigninForm(),
              MyFormDivider(
                deviderText: S.current.orSignInWith.toUpperCase(),
              ),
              const SizedBox(height: MyDimensions.spaceBetweenSections),
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
