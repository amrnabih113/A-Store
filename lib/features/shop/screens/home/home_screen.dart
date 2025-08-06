import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/styles/sectionseparator.dart';
import 'package:a_store/common/widgets/mygridviw_layout.dart';
import 'package:a_store/common/widgets/mysearch.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/common/widgets/myverticalimagetext.dart';
import 'package:a_store/common/widgets/product_card/product_card_vertical.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/features/shop/controllers/products/all_products_controller.dart';
import 'package:a_store/features/shop/controllers/category_controller.dart';
import 'package:a_store/features/shop/controllers/products/products_controller.dart';
import 'package:a_store/features/shop/screens/allproducts/all_products_screen.dart';
import 'package:a_store/features/shop/screens/sub_category/sub_category_screen.dart';
import 'package:a_store/features/shop/widgets/home/home_appbar.dart';
import 'package:a_store/features/shop/widgets/home/home_header.dart';
import 'package:a_store/features/shop/widgets/home/promo_carousel.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:a_store/utils/shimmer/category_shimmer.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:a_store/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    final productController = Get.put(ProductsController());
    final AllProductController allProductController =
        Get.put(AllProductController());

    return RefreshIndicator(
      color: MyColors.primaryColor,
      backgroundColor: MyHelperFunctions.isDarkMode(context)
          ? MyColors.dark
          : MyColors.light,
      displacement: 20,
      onRefresh: () async {
        await productController.refreshData();
      },
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          MyHomeHeader(
              child: Column(children: [
            //appbar
            const MyHomeAppBar(),
            Sectionseparator.verticalSeparator(),

            //search
            MySearchContainer(
              icon: Iconsax.search_normal,
              text: S.current.searchInStore,
            ),
            Sectionseparator.verticalSeparator(),

            //categories =======================================================
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MyDimensions.defultSpacing),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MySectionHeading(
                      title: S.current.popularCategories,
                      showActionButton: false,
                      textColor: MyColors.white,
                    ),
                    ItemSeparator.verticalSeparator(),

                    //categories containers
                    Obx(() {
                      final categories = SettingsController.instance.isArabic()
                          ? categoryController.translatedCategories
                          : categoryController.featuredCategories;
                      if (categoryController.isLoading.value) {
                        return const MyCategoryShimmer();
                      }
                      if (categories.isEmpty) {
                        return Center(
                            child: Text(
                          S.current.noCategoriesFound,
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: MyColors.white,
                              ),
                        ));
                      }
                      return SizedBox(
                        height: 90,
                        child: ListView.builder(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return MyVerticalImageText(
                              onTap: () => Get.to(() => SubCategoryScreen(
                                    category: categories[index],
                                  )),
                              title: categories[index].name,
                              image: categories[index].image,
                              textColor: MyColors.white,
                            );
                          },
                        ),
                      );
                    }),
                  ]),
            ),
            Sectionseparator.verticalSeparator(),
          ])),
          // banners ===========================================================
          const Padding(
              padding: EdgeInsets.all(MyDimensions.defultSpacing),
              child: PromoCarousel()),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MyDimensions.defultSpacing),
            child: MySectionHeading(
                title: S.current.popularProducts,
                showActionButton: true,
                buttontext: S.current.viewAll,
                onPressed: () => Get.to(() => AllProductsScreen(
                      title: S.current.popularProducts,
                      futureMethod: allProductController.fetchAllProducts(),
                    ))),
          ),
          //products ==========================================================
          Obx(() {
            final products = productController.productPackages;
            if (productController.isLoading.value) {
              return Padding(
                padding: const EdgeInsets.all(MyDimensions.defultSpacing),
                child: MyGridViweLayout(
                  itemCount: 4,
                  itemBuilder: (_, __) {
                    return const MyShimmerEffect(width: 180, height: 180);
                  },
                ),
              );
            }
            if (products.isEmpty) {
              return Center(
                  child: Text(S.current.noProductsFound,
                      style: Theme.of(context).textTheme.bodyMedium));
            }
            return Padding(
              padding: const EdgeInsets.all(MyDimensions.defultSpacing),
              child: MyGridViweLayout(
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final product = products[index];
                  return ProductCardVertical(
                    product: product,
                  );
                },
              ),
            );
          }),
        ])),
      ),
    );
  }
}
