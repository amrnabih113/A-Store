import 'package:a_store/features/shop/controllers/products/images_controller.dart';
import 'package:a_store/features/shop/models/product_model.dart';
import 'package:a_store/features/shop/models/variation_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap<String, dynamic> selectedAttributes = <String, dynamic>{}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  void attributeSelected(
      ProductModel product, String attributeName, String attributeValue) {
    selectedAttributes[attributeName] = attributeValue;

    final variation = product.variations.firstWhere(
      (v) => _isSameAttributeValues(
          v.attributeValues.toJson(), selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    selectedVariation.value = variation;

    if (variation.image.isNotEmpty) {
      ImagesController.instance.selectedImage.value = variation.image;
    }
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) {
      return false;
    }
    for (var key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) {
        return false;
      }
    }
    return true;
  }

  Set<String> getAttributeAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    return variations
        .where((v) =>
            v.attributeValues.toJson()[attributeName]?.isNotEmpty == true &&
            v.stock > 0)
        .map((v) => v.attributeValues.toJson()[attributeName] as String)
        .toSet();
  }

  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? S.current.inStock : S.current.outOfStock;
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
