import 'package:a_store/data/repositories/brands/brands_repository.dart';
import 'package:a_store/features/shop/models/brands_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandsController extends GetxController {
  static BrandsController get instance => Get.find();

  final brandsRepository = Get.put(BrandsRepository());
  RxList<BrandsModel> brands = <BrandsModel>[].obs;
  RxList<BrandsModel> featuredBrands = <BrandsModel>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBrands();
  }

  Future<void> fetchBrands() async {
    try {
      isLoading.value = true;
      final fetchedBrands = await brandsRepository.fetchBrands();
      brands.assignAll(fetchedBrands);
      featuredBrands.assignAll(brands.take(4).toList());
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      MyLoaders.errorSnackBar(
          title:S.current.ohSnap,
          message: S.current.errorMessage);
    }
  }

  List<BrandsModel> getCatergoryBrands(int id) =>
      brands.where((brand) => brand.categoryId == id).toList();
}
