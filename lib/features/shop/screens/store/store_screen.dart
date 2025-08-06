import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/brand/mybrand_card.dart';
import 'package:a_store/common/widgets/mytapbar.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mygridviw_layout.dart';
import 'package:a_store/common/widgets/mysearch.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/common/widgets/product_card/product_card_vertical.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/controllers/products/all_products_controller.dart';
import 'package:a_store/features/shop/controllers/brands_controller.dart';
import 'package:a_store/features/shop/controllers/category_controller.dart';
import 'package:a_store/features/shop/controllers/products/products_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/features/shop/screens/cart/cart_screen.dart';
import 'package:a_store/features/shop/screens/allproducts/all_brands_screen.dart';
import 'package:a_store/features/shop/screens/allproducts/all_products_screen.dart';
import 'package:a_store/features/shop/screens/allproducts/brand_products_screen.dart';
import 'package:a_store/features/shop/widgets/store/barnd_show_case.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:a_store/generated/l10n.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final categoryController = CategoryController.instance;
    final brandsController = Get.put(BrandsController());
    final cartController = CartController.instance;
    return Obx(() {
      final categories = SettingsController.instance.isArabic() ? categoryController.translatedCategories : categoryController.featuredCategories;
      final isCategoriesLoading = categoryController.isLoading.value;

      return DefaultTabController(
        length: categories.isNotEmpty ? categories.length : 1,
        child: Scaffold(
          appBar: MyAppBar(
            showBackButton: false,
            title: Text(
              S.current.store, 
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(MyDimensions.sm),
                child: Obx(
                  () => Badge(
                    alignment: Alignment.topRight,
                    label: Text(cartController.noOfItems.value.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(color: MyColors.white)),
                    backgroundColor: MyColors.primaryColor,
                    child: IconButton(
                      onPressed: () => Get.to(() => const CartScreen()),
                      icon: const Icon(
                        Iconsax.shopping_bag,
                        color: MyColors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) => [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? MyColors.dark : MyColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(MyDimensions.defultSpacing),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ItemSeparator.verticalSeparator(),
                      MySearchContainer(
                        padding: const EdgeInsets.all(0),
                        text: S.current.search_in_store,
                        icon: Iconsax.search_normal,
                        showBackGround: false,
                        showBorder: true,
                      ),
                      ItemSeparator.verticalSeparator(),
                      MySectionHeading(
                        title: S.current.featured_brands,
                        showActionButton: true,
                        onPressed: () => Get.to(() => AllBrandsScreen(
                              title: S.current.brands,
                            )),
                      ),
                      ItemSeparator.halfVerticalSeparator(),
                      Obx(() {
                        final brands = brandsController.featuredBrands;
                        return brandsController.isLoading.value
                            ? MyGridViweLayout(
                                mainAxisExtend: 80,
                                itemBuilder: (_, __) {
                                  return const MyShimmerEffect(
                                      width: 80, height: 80);
                                },
                                itemCount: 4)
                            : MyGridViweLayout(
                                mainAxisExtend: 80,
                                itemCount: brands.length,
                                itemBuilder: (_, index) {
                                  final brand = brands[index];
                                  return MyBrandCard(
                                    isNetworkImage: true,
                                    onTap: () =>
                                        Get.to(() => BrandProductsScreen(
                                              brand: brand,
                                            )),
                                    showBorders: true,
                                    logo: brand.image,
                                    title: brand.name,
                                    productsCount:
                                        brand.productsCount.toString(),
                                  );
                                });
                      })
                    ],
                  ),
                ),
                bottom: MyTapBar(
                  indicatorColor: MyColors.primaryColor,
                  tabs: categories.isEmpty
                      ? [
                          const Tab(
                              child: MyShimmerEffect(width: 100, height: 30))
                        ]
                      : categories
                          .map((category) => Tab(
                                child: Text(category.name),
                              ))
                          .toList(),
                ),
              )
            ],
            body: isCategoriesLoading
                ? const Center(
                    child:
                        CircularProgressIndicator(color: MyColors.primaryColor),
                  )
                : categories.isEmpty
                    ? Center(
                        child: Text(
                          S.current
                              .no_categories_available, // Replaced static text with localization
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : TabBarView(
                        children: [
                          for (int i = 0; i < categories.length; i++)
                            MyCategoryTab(
                              categoryId: categories[i].id!,
                            )
                        ],
                      ),
          ),
        ),
      );
    });
  }
}

class MyCategoryTab extends StatelessWidget {
  const MyCategoryTab({
    super.key,
    required this.categoryId,
  });
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    final controller = BrandsController.instance;
    final brands = controller.getCatergoryBrands(categoryId);
    final productsController = ProductsController.instance;
    final AllProductController allProductController =
        Get.put(AllProductController());
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(MyDimensions.defultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              brands.isEmpty
                  ? Center(
                      child: Text(
                      S.current
                          .no_brands_found, // Replaced static text with localization
                      style: Theme.of(context).textTheme.headlineSmall,
                    ))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: brands.length,
                      itemBuilder: (context, index) {
                        final brand = brands[index];
                        return FutureBuilder<Object>(
                            future: productsController
                                .filterProductsByBrand(brand.id),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding:
                                      EdgeInsets.only(top: MyDimensions.md),
                                  child: MyShimmerEffect(
                                      width: double.infinity, height: 100),
                                );
                              }
                              if (!snapshot.hasData || snapshot.data == null) {
                                return const SizedBox.shrink();
                              }
                              final brandProducts =
                                  snapshot.data as List<ProductPackage>;
                              return MyBrandShowCase(
                                  isLoading: productsController.isLoading.value,
                                  isNetworkImage: true,
                                  onTap: () => Get.to(() => BrandProductsScreen(
                                        brand: brand,
                                      )),
                                  logo: brand.image,
                                  title: brand.name,
                                  productsCount:
                                      '${brand.productsCount} ${S.current.products}', // Replaced static text with localization
                                  topProducts: brandProducts.isNotEmpty &&
                                          brandProducts[0]
                                              .product
                                              .images
                                              .isNotEmpty
                                      ? brandProducts[0].product.images
                                      : []);
                            });
                      },
                    ),
              ItemSeparator.verticalSeparator(),
              MySectionHeading(
                title: S.current
                    .you_may_also_like, // Replaced static text with localization
                showActionButton: true,
                onPressed: () => Get.to(() => AllProductsScreen(
                      title: S.current
                          .you_may_also_like, // Replaced static text with localization
                      futureMethod: allProductController
                          .fetchProductsByCategory(categoryId),
                    )),
              ),
              ItemSeparator.verticalSeparator(),
              FutureBuilder<Object>(
                  future:
                      productsController.filterProductsByCategory(categoryId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return MyGridViweLayout(
                        itemCount: 10,
                        itemBuilder: (_, __) {
                          return const MyShimmerEffect(width: 180, height: 180);
                        },
                      );
                    }
                    if (!snapshot.hasData || snapshot.data == null) {
                      return Center(
                        child: Text(
                          S.current
                              .no_products_found, // Replaced static text with localization
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    }
                    final categoryProducts =
                        snapshot.data as List<ProductPackage>;
                    return MyGridViweLayout(
                        itemCount: categoryProducts.length,
                        itemBuilder: (_, index) {
                          return ProductCardVertical(
                            product: categoryProducts[index],
                          );
                        });
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
