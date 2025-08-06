import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mygridviw_layout.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/features/shop/screens/allproducts/sortable_products.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, required this.futureMethod});
  final String title;
  final Future<List<ProductPackage>> futureMethod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            showBackButton: true,
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            )),
        body: SingleChildScrollView(
          child: FutureBuilder<Object>(
              future: futureMethod,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.all(MyDimensions.defultSpacing),
                    child: MyGridViweLayout(
                      itemCount: 10,
                      itemBuilder: (_, __) {
                        return const MyShimmerEffect(width: 180, height: 180);
                      },
                    ),
                  );
                }
                final products = snapshot.data as List<ProductPackage>;
                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    products.isEmpty) {
                  return  Center(
                    child: Text(S.current.noProductsFound),
                  );
                }
                if (snapshot.hasError) {
                  return  Center(child: Text(S.current.errorMessage));
                }

                return Padding(
                  padding: const EdgeInsets.all(MyDimensions.defultSpacing),
                  child: SortableProducts(
                    products: products,
                  ),
                );
              }),
        ));
  }
}
