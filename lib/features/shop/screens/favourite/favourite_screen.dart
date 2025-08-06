import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mygridviw_layout.dart';
import 'package:a_store/common/widgets/product_card/product_card_vertical.dart';
import 'package:a_store/features/shop/controllers/favourite_controller.dart';
import 'package:a_store/features/shop/controllers/products/all_products_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/features/shop/screens/allproducts/all_products_screen.dart';
import 'package:a_store/navigation_menu.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/cloud_helper_functions.dart';
import 'package:a_store/utils/loaders/animation_loader.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:a_store/generated/l10n.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: false,
        title: Text(S.current.wishlist, style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => AllProductsScreen(
                    title: S.current.allProducts,
                    futureMethod: AllProductController.instance.fetchAllProducts(),
                  ));
            },
            icon: const Icon(Iconsax.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MyDimensions.defultSpacing),
          child: Obx(
            () => FutureBuilder<List<ProductPackage>>(
              future: controller.favouriteProducts(),
              builder: (context, snapshot) {
                final loader = MyGridViweLayout(
                  itemCount: 10,
                  itemBuilder: (_, __) {
                    return const MyShimmerEffect(width: 180, height: 180);
                  },
                );
                final emptyWidget = MyAnimationLoaderWidget(
                  text: S.current.wishlistEmpty,
                  showAction: true,
                  animation: MyImages.pencilDrawingAnimation,
                  actionText: S.current.addSome,
                  onActionPressed: () {
                    NavigationController.instance.selectedIndex.value = 0;
                  },
                );
                final widget = MyCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget);
                if (widget != null) {
                  return widget;
                }
                final favouriteProducts = snapshot.data!;
                return MyGridViweLayout(
                  itemBuilder: (_, index) {
                    return ProductCardVertical(
                        product: favouriteProducts[index]);
                  },
                  itemCount: favouriteProducts.length,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
