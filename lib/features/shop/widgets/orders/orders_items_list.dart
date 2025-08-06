import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/features/shop/controllers/orders_controller.dart';
import 'package:a_store/features/shop/models/order_model.dart';
import 'package:a_store/features/shop/screens/orders/order_details_screen.dart';
import 'package:a_store/features/shop/widgets/orders/order_irem.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersItemsList extends StatelessWidget {
  const OrdersItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersController = Get.put(OrdersController());
    MyHelperFunctions.isDarkMode(context);
    return FutureBuilder<List<OrderModel>>(
      future: ordersController.fetchUserOrders(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('${S.current.error}: ${snapshot.error}'));
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return  Center(child: Text(S.current.noOrdersFound));
        } else if (snapshot.hasData) {
          final orders = snapshot.data!;
          return ListView.separated(
            separatorBuilder: (_, __) => ItemSeparator.verticalSeparator(),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () => Get.to(() => OrderDetailsScreen(
                        order: orders[index]
                      )),
                  child: OrderItem(order: orders[index]));
            },
            itemCount: orders.length,
          );
        }
        return  Center(child: Text(S.current.noOrdersFound));
      },
    );
  }
}
