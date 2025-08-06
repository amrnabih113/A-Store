import 'package:a_store/common/widgets/brand/mybrand_card.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mygridviw_layout.dart';
import 'package:a_store/features/shop/controllers/brands_controller.dart';
import 'package:a_store/features/shop/screens/allproducts/brand_products_screen.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final brandsController = BrandsController.instance;
    return Scaffold(
        appBar: MyAppBar(
            showBackButton: true,
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MyDimensions.defultSpacing),
            child: Column(
              children: [
                Obx(() {
                  final brands = brandsController.brands;

                  if (brandsController.isLoading.value) {
                    MyGridViweLayout(
                        mainAxisExtend: 80,
                        itemBuilder: (_, __) {
                          return const MyShimmerEffect(width: 80, height: 80);
                        },
                        itemCount: 16);
                  }
                  if (brands.isEmpty) {
                    return Center(
                        child: Text(S.current.noBrandsFound,
                            style: Theme.of(context).textTheme.headlineSmall));
                  }
                  return MyGridViweLayout(
                      mainAxisExtend: 80,
                      itemBuilder: (context, index) {
                        final brand = brands[index];
                        return MyBrandCard(
                          isNetworkImage: true,
                          logo: brand.image,
                          productsCount: brand.productsCount.toString(),
                          title: brand.name,
                          showBorders: true,
                          onTap: () => Get.to(() => BrandProductsScreen(
                                brand: brand,
                              )),
                        );
                      },
                      itemCount: brands.length);
                })
              ],
            ),
          ),
        ));
  }
}
