import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/shop/widgets/orders/orders_items_list.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title:
            Text(S.current.orders, style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MyDimensions.defultSpacing),
          child: Column(
            children: [OrdersItemsList()],
          ),
        ),
      ),
    );
  }
}
