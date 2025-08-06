import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/personalization/widgets/payments/payment_method_tile.dart';
import 'package:a_store/features/shop/models/payment_method_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppBar(
        title: Text(S.current.paymentMethods),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MyDimensions.defultSpacing),
          child: Column(
            children: [
              PaymentMethodTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Credit Card',
                  image: MyImages.creditCard,
                ),
              ),
              PaymentMethodTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Master Card',
                  image: MyImages.masterCard,
                ),
              ),
              PaymentMethodTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Visa',
                  image: MyImages.visa,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
