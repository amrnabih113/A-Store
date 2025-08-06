import 'package:a_store/data/repositories/products/products_repository.dart';
import 'package:a_store/features/shop/controllers/banners_controller.dart';
import 'package:a_store/features/shop/controllers/brands_controller.dart';
import 'package:a_store/features/shop/controllers/category_controller.dart';
import 'package:a_store/features/shop/models/product_model.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();

  final ProductsRepository productsRepository = Get.put(ProductsRepository());
  final CategoryController categoryController = Get.put(CategoryController());
  final BrandsController brandsController = Get.put(BrandsController());

  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<ProductPackage> productPackages = <ProductPackage>[].obs;

  List<ProductModel> filteredProducts = <ProductModel>[];

  Rx<bool> isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> refreshData() async {
    isLoading.value = true;
    await categoryController.fetchCategories();
    await categoryController.translateCategories();
    await brandsController.fetchBrands();
    await BannersController.instance.fetchBanners();
    await fetchProducts();
    isLoading.value = false;
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      // Wait for all controllers to fetch their data
      await Future.wait([
        categoryController.fetchCategories(),
        brandsController.fetchBrands(),
      ]);

      // Once all are fetched, fetch the products
      await fetchProducts();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
    }
  }

  Future<void> fetchProducts() async {
    try {
      final fetchedproducts = await productsRepository.fetchProducts();
      products.assignAll(fetchedproducts);
      productPackages.assignAll(getProductPackages(products));
    } catch (e) {
      isLoading.value = false;
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
    }
  }

  List<ProductPackage> getProductPackages(List<ProductModel> products) {
    List<ProductPackage> packages = [];
    try {
      if (products.isNotEmpty &&
          categoryController.categories.isNotEmpty &&
          brandsController.brands.isNotEmpty) {
        for (var product in products) {
          packages.add(ProductPackage(
            product: product,
            brand: brandsController.brands
                .firstWhere((brand) => brand.id == product.brandId),
            category: categoryController.categories
                .firstWhere((category) => category.id == product.categoryId),
          ));
        }
      }
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
    }
    return packages;
  }

  Future<List<ProductPackage>> filterProductsByCategory(int categoryId) async {
    try {
      final filteredProducts = await productsRepository
          .fetchProductsByCategory(categoryId, limit: 4);
      return getProductPackages(filteredProducts);
    } catch (e) {
      return [];
    }
  }

  Future<List<ProductPackage>> filterProductsByBrand(int brandId) async {
    try {
      final filteredProducts =
          await productsRepository.fetchProductsByBrand(brandId, limit: 4);
      return getProductPackages(filteredProducts);
    } catch (e) {
      return [];
    }
  }

  String? getProductPriceVariation(ProductModel product) {
    double? max;
    double? min;

    if (product.variations.isNotEmpty) {
      for (var variation in product.variations) {
        double price = double.parse(variation.price.toString());
        if (max == null || price > max) {
          max = price;
        }
        if (min == null || price < min) {
          min = price;
        }
      }
      if (max == null || min == null) {
        return null;
      }
      if (max == min) return "$min";
      return "$min - \$$max";
    }

    return null;
  }
}
