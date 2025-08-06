import 'dart:convert';
import 'package:a_store/data/repositories/products/products_repository.dart';
import 'package:a_store/features/shop/controllers/products/products_controller.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/local_storage/storage_utility.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void initFavourites() {
    final json = MyLocalStorage.instance().readData("favourites");
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(int productId) => favourites[productId.toString()] ?? false;

  void toggleFavourite(int productId) {
    if (!favourites.containsKey(productId.toString())) {
      favourites[productId.toString()] = true;
      saveFavouritesToStorage();
      favourites.refresh();
      MyLoaders.customToast(message: S.current.addedToWishlist);
    } else {
      MyLocalStorage.instance().removeData("favourites");
      favourites.remove(productId.toString());
      saveFavouritesToStorage();
      favourites.refresh();
      MyLoaders.customToast(message: S.current.removedFromWishlist);
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = jsonEncode(favourites);
    MyLocalStorage.instance().saveData("favourites", encodedFavourites);
  }

  Future<List<ProductPackage>> favouriteProducts() async {
    final List<int> favouriteIds = favourites.keys
        .map((key) => int.tryParse(key))
        .whereType<int>()
        .toList();
    final products =
        await ProductsRepository.instance.fetchFavouriteProducts(favouriteIds);

    final productPackages =
        ProductsController.instance.getProductPackages(products);

    return productPackages;
  }
}
