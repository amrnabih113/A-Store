import 'package:a_store/data/repositories/products/products_repository.dart';
import 'package:a_store/features/shop/controllers/products/products_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final selectedSortOption = S.current.name.obs;
  final repository = ProductsRepository.instance;
  final productController = ProductsController.instance;
  final products = <ProductPackage>[].obs;

  Future<List<ProductPackage>> fetchAllProducts() async {
    try {
      final products = await repository.fetchALLProducts();
      final productPackages = productController.getProductPackages(products);
      return productPackages;
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
      return [];
    }
  }

  Future<List<ProductPackage>> fetchProductsByCategory(int categoryId) async {
    try {
      final products = await repository.fetchProductsByCategory(categoryId);
      final productPackages = productController.getProductPackages(products);
      return productPackages;
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
      return [];
    }
  }

  Future<List<ProductPackage>> fetchProductsByBrand(int brandId) async {
    try {
      final products = await repository.fetchProductsByBrand(brandId);
      final productPackages = productController.getProductPackages(products);
      return productPackages;
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
      return [];
    }
  }

  void sortProducts(String option) {
    selectedSortOption.value = option;
    if (option == S.current.name) {
      products.sort((a, b) => a.product.name.compareTo(b.product.name));
    } else if (option == S.current.priceLowToHigh) {
      products.sort((a, b) => a.product.price.compareTo(b.product.price));
    } else if (option == S.current.priceHighToLow) {
      products.sort((a, b) => b.product.price.compareTo(a.product.price));
    } else if (option == S.current.sale) {
      products.sort((a, b) =>
          b.product.discountPercentage.compareTo(a.product.discountPercentage));
    } else if (option == S.current.newest) {
      products
          .sort((a, b) => b.product.createdAt.compareTo(a.product.createdAt));
    } else {
      products.sort((a, b) => a.product.name.compareTo(b.product.name));
    }
  }

  void assignProducts(List<ProductPackage> products) {
    this.products.assignAll(products);
    sortProducts(S.current.name);
  }
}
