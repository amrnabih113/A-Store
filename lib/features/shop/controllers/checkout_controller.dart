import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/features/personalization/models/address_model.dart';
import 'package:a_store/features/shop/models/payment_method_model.dart';
import 'package:a_store/features/shop/widgets/checkout/my_payment_method_tile.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Credit Card', image: MyImages.creditCard);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) async {
    return await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(MyDimensions.lg),
                child: Column(
                  children: [
                     MySectionHeading(
                      title: S.current.selectPaymentMethod,
                      showActionButton: false,
                    ),
                    ItemSeparator.verticalSeparator(),
                    MyPaymentMethodTile(
                      paymentMethod: PaymentMethodModel(
                          name: 'Credit Card', image: MyImages.creditCard),
                    ),
                    MyPaymentMethodTile(
                        paymentMethod: PaymentMethodModel(
                      name: 'PayPal',
                      image: MyImages.paypal,
                    )),
                    MyPaymentMethodTile(
                        paymentMethod: PaymentMethodModel(
                      name: 'Google Pay',
                      image: MyImages.googlePay,
                    )),
                    MyPaymentMethodTile(
                        paymentMethod: PaymentMethodModel(
                      name: 'Apple Pay',
                      image: MyImages.applePay,
                    )),
                    MyPaymentMethodTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Visa', image: MyImages.visa))
                  ],
                ),
              ),
            ));
  }

  
}
