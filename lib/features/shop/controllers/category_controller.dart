import 'package:a_store/data/repositories/categories/categories_repository.dart';
import 'package:a_store/features/shop/models/category_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final CategoriesRepository categoriesRepository =
      Get.put(CategoriesRepository());
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<CategoryModel> translatedCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  Rx<bool> isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchCategories();
    await translateCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final fetchedCategories = await categoriesRepository.fetchCategories();
      categories.assignAll(fetchedCategories);
      featuredCategories.assignAll(fetchedCategories
          .where((category) => category.parentId.isEmpty && category.isFeatured)
          .toList()
        ..sort((a, b) => a.name.compareTo(b.name)));
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
    }
  }

  Future<void> translateCategories() async {
    try {
      isLoading.value = true;
      final tranlatedCategories =
          await CategoryTranslator().translateCategories(featuredCategories);
      translatedCategories.assignAll(tranlatedCategories);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
    }
  }
}
