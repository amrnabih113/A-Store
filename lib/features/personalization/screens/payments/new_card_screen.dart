import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/personalization/controllers/credit_card_controller.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_credit_card/u_credit_card.dart';
import 'package:a_store/generated/l10n.dart';

class NewCardScreen extends StatelessWidget {
  const NewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreditCardController());

    return Scaffold(
      appBar: MyAppBar(
        title: Text(S.current.newCard),
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(MyDimensions.defultSpacing),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  String month = controller.expiryDate.value.length >= 5
                      ? controller.expiryDate.value.substring(0, 2)
                      : '';
                  String year = controller.expiryDate.value.length >= 5
                      ? controller.expiryDate.value.substring(3, 5)
                      : '';

                  return CreditCardUi(
                    width: double.infinity,
                    cardHolderFullName: controller.cardHolderName.value,
                    cardNumber: controller.cardNumber.value,
                    validFrom: month,
                    validThru: year,
                    topLeftColor: MyColors.primaryColor,
                    doesSupportNfc: true,
                    placeNfcIconAtTheEnd: true,
                    cardType: CardType.debit,
                    cardProviderLogo: Image.asset(MyImages.creditCard),
                    cardProviderLogoPosition: CardProviderLogoPosition.right,
                    showBalance: true,
                    balance: 128.32,
                    autoHideBalance: true,
                    enableFlipping: true,
                    cvvNumber: controller.cvv.value,
                  );
                }),
                const SizedBox(height: 25),
                TextFormField(
                  controller: controller.cardNumberController,
                  decoration: InputDecoration(
                    labelText: S.current.cardNumber,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.credit_card),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  onChanged: (value) => controller.cardNumber.value = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.current.enterCardNumber;
                    } else if (value.length != 16) {
                      return S.current.cardNumberLength;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.cardHolderNameController,
                  decoration: InputDecoration(
                    labelText: S.current.cardholderName,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                  onChanged: (value) => controller.cardHolderName.value = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.current.enterCardholderName;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.expiryDateController,
                        decoration: InputDecoration(
                          labelText: S.current.expiryDate,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.calendar_today),
                        ),
                        keyboardType: TextInputType.datetime,
                        onChanged: (value) =>
                            controller.expiryDate.value = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.current.enterExpiryDate;
                          } else if (!RegExp(r"^(0[1-9]|1[0-2])/\d{2}")
                              .hasMatch(value)) {
                            return S.current.validExpiryDate;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: controller.cvvController,
                        decoration: InputDecoration(
                          labelText: S.current.cvv,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        obscureText: true,
                        onChanged: (value) => controller.cvv.value = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.current.enterCvv;
                          } else if (value.length != 3) {
                            return S.current.cvvLength;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(S.current.saveCardInfo),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
