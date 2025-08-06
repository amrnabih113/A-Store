import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/personalization/screens/payments/new_card_screen.dart';
import 'package:a_store/features/shop/models/payment_method_model.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u_credit_card/u_credit_card.dart';

class MyCards extends StatelessWidget {
  const MyCards({super.key, required this.paymentMethod});
  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("My ${paymentMethod.name}s"),
        showBackButton: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const NewCardScreen()),
        backgroundColor: MyColors.primaryColor,
        child: const Icon(
          Iconsax.add,
          color: MyColors.white,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(MyDimensions.defultSpacing),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return CreditCardUi(
              cardHolderFullName: 'Amr Nabih',
              cardNumber: '1234567812345678',
              validFrom: '01/23',
              validThru: '01/28',
              topLeftColor: MyColors.primaryColor,
              doesSupportNfc: true,
              placeNfcIconAtTheEnd: true,
              cardType: CardType.debit,
              cardProviderLogo: Image.asset(MyImages.masterCard),
              cardProviderLogoPosition: CardProviderLogoPosition.right,
              showBalance: true,
              balance: 1235.02654,
              autoHideBalance: true,
              enableFlipping: true,
              cvvNumber: '123',
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      )),
    );
  }
}
