import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';

class SigninHeader extends StatelessWidget {
  const SigninHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        S.current.loginTitle,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      const SizedBox(height: MyDimensions.sm),
      Text(
        S.current.loginSubTitle,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ]);
  }
}
