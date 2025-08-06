import 'package:a_store/data/repositories/banners/banners_repository.dart';
import 'package:a_store/features/shop/models/banner_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannersController extends GetxController {
  static BannersController get instance => Get.find();

  final BannersRepository bannersRepository = Get.put(BannersRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxList<BannerModel> activeBanners = <BannerModel>[].obs;

  final carouselCurrentIndex = 0.obs;
  Rx<bool> isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final fetchedBanners = await bannersRepository.fetchBanners();
      banners.assignAll(fetchedBanners);
      activeBanners.assignAll(
          fetchedBanners.where((banner) => banner.isActive).take(3).toList());
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
    }
  }

  void updatePageIndicator(int index) => carouselCurrentIndex.value = index;
}
