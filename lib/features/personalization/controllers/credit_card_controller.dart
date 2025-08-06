
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditCardController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final cardHolderNameController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  RxString cardNumber = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cvv = ''.obs;

  @override
  void onClose() {
    cardNumberController.dispose();
    cardHolderNameController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.onClose();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // void processPayment(BuildContext context) {
  //   if (validateForm()) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Payment processed successfully!')),
  //     );
  //   }
  // }
}