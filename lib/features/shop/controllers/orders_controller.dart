import 'package:a_store/data/repositories/orders/orders_repository.dart';
import 'package:a_store/data/repositories/user/user_repository.dart';
import 'package:a_store/features/authentication/screens/success_screen.dart';
import 'package:a_store/features/personalization/controllers/addresses_controller.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/controllers/checkout_controller.dart';
import 'package:a_store/features/shop/models/order_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/navigation_menu.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/network_manager.dart';
import 'package:a_store/utils/helpers/pricing_calculator.dart';
import 'package:a_store/utils/popups/full_screen_loader.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'dart:math';

class OrdersController extends GetxController {
  static OrdersController get instance => Get.find();

  final ordersRepository = Get.put(OrdersRepository());
  final cartController = CartController.instance;
  final checkoutController = CheckoutController.instance;
  final addressController = AddressesController.instance;
  final user = UserRepository.instance.user;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final orders = await ordersRepository.fetchUserOrders();
      return orders;
    } catch (e) {
      MyLoaders.errorSnackBar(
          title: S.current.ohSnap, message: S.current.errorMessage);
      return [];
    }
  }

  Future<void> processOrder() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.requestProcessing, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      final newOrder = OrderModel(
        id: generateFiveDigitUUID(),
        userId: user!.uid,
        orderDate: DateTime.now(),
        items: cartController.cartItems.map((item) => item.toJson()).toList(),
        status: "Processing",
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        totalAmount: MyPricingCalculator.calculateTotalPrice(
            cartController.totalCartPrice.value, 'USA'),
        shippingAddress: addressController.selectedAddress.value.fullAddress,
        notes: null,
      );
      await ordersRepository.addNewOrder(newOrder);
      cartController.clearCart();
      MyFullScreenLoader.stopLoading();
      Get.to(() => SuccessScreen(
            image: MyImages.paymentSuccessfulAnimation,
            title: S.current.success,
            subtitle: S.current.orderPlacedMessage,
            onPressed: () {
              Get.offAll(() => const NavigationMenu());
            },
          ));
    } catch (e) {
      MyLoaders.errorSnackBar(
          title: S.current.ohSnap, message: S.current.errorMessage);
      MyFullScreenLoader.stopLoading();
    }
  }
}

String generateFiveDigitUUID() {
  final random = Random();
  int randomNumber = 10000 + random.nextInt(90000);
  return randomNumber.toString();
}
