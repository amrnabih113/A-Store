import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/brand/mybrand_card.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mygridviw_layout.dart';
import 'package:a_store/features/shop/controllers/products/all_products_controller.dart';
import 'package:a_store/features/shop/models/brands_model.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/features/shop/screens/allproducts/sortable_products.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, required this.brand});
  final BrandsModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = AllProductController.instance;
    return Scaffold(
        appBar: MyAppBar(
          showBackButton: true,
          title: Text(
            brand.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MyDimensions.defultSpacing),
            child: Column(
              children: [
                MyBrandCard(
                  isNetworkImage: true,
                  logo: brand.image,
                  title: brand.name,
                  productsCount: brand.productsCount.toString(),
                  showBorders: true,
                ),
                ItemSeparator.verticalSeparator(),
                ItemSeparator.verticalSeparator(),
                FutureBuilder<Object>(
                    future: controller.fetchProductsByBrand(brand.id,),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return MyGridViweLayout(
                          itemCount: 10,
                          itemBuilder: (_, __) {
                            return const MyShimmerEffect(
                                width: 180, height: 180);
                          },
                        );
                      }
                      final products = snapshot.data as List<ProductPackage>;
                      if (!snapshot.hasData ||
                          snapshot.data == null ||
                          products.isEmpty) {
                        return Center(
                          child: Text(
                            S.current.noProductsFound,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        );
                      }

                      if (snapshot.hasError) {
                        return  Center(
                            child: Text(S.current.errorMessage));
                      }

                      return SortableProducts(
                        products: products,
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
