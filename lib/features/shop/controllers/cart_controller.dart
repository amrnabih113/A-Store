import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/features/shop/controllers/products/variation_controller.dart';
import 'package:a_store/features/shop/models/cart_item_model.dart';
import 'package:a_store/features/shop/models/product_package.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/local_storage/storage_utility.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final VariationController variationController = VariationController.instance;
  final settingController = SettingsController.instance;

  CartController() {
    loadCartItems();
  }

  void addToCart(ProductPackage productPackage) {
    if (productQuantityInCart < 1) {
      MyLoaders.customToast(
        message: S.current.selectQuantity,
      );
      return;
    }
    if (productPackage.product.isVariable &&
        variationController.selectedVariation.value.id.isEmpty) {
      MyLoaders.customToast(
        message: S.current.selectVariation,
      );
      return;
    }
    if (productPackage.product.isVariable) {
      if (variationController.selectedVariation.value.stock <
          productQuantityInCart.value) {
        MyLoaders.warningSnackBar(
          message: S.current.outOfStock,
          title: S.current.ohSnap,
        );
        return;
      }
    } else if (productPackage.product.stock <= productQuantityInCart.value ||
        productPackage.product.stock == 0) {
      MyLoaders.warningSnackBar(
        message: S.current.outOfStock,
        title: S.current.ohSnap,
      );
      return;
    }
    final cartItem =
        convertToCartItem(productPackage, productQuantityInCart.value);
    int index = cartItems.indexWhere((item) =>
        item.productId == cartItem.productId &&
        item.selectedVariation == cartItem.selectedVariation);
    if (index >= 0) {
      cartItems[index].quantity = cartItem.quantity;
    } else {
      cartItems.add(cartItem);
    }
    updateCart();
    MyLoaders.successSnackBar(
        title: S.current.success,
        message: settingController.isArabic()
            ? 'تم إضافة ${cartItem.quantity} ${cartItem.title} إلى السلة.'
            : '${cartItem.quantity} ${cartItem.title} added to the Cart.');
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calcutedprice = 0.0;
    int calculatedNoOfItems = 0;
    for (var item in cartItems) {
      calcutedprice += item.price * item.quantity;
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calcutedprice;
    noOfItems.value = calculatedNoOfItems;
  }

  void addOneToCart(CartItemModel cartItem) {
    int index = cartItems.indexWhere((item) =>
        item.productId == cartItem.productId &&
        item.variationId == cartItem.variationId);
    if (index >= 0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(cartItem);
    }
    updateCart();
    MyLoaders.customToast(
        message: settingController.isArabic()
            ? 'تم إضافة ${cartItem.quantity} ${cartItem.title} إلى السلة.'
            : '${cartItem.quantity} ${cartItem.title} added to the Cart.');
  }

  void removeOneFromCart(CartItemModel cartItem) {
    int index = cartItems.indexWhere((item) =>
        item.productId == cartItem.productId &&
        item.variationId == cartItem.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: S.current.removeProduct,
      middleText: S.current.confirmRemove,
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        MyLoaders.customToast(
          message: S.current.removedFromCart,
        );
        Navigator.of(Get.overlayContext!).pop();
      },
      onCancel: () => Navigator.of(Get.overlayContext!).pop(),
    );
  }

  void saveCartItems() {
    final cartItemsList = cartItems.map((item) => item.toJson()).toList();

    MyLocalStorage.instance()
        .saveData<List<dynamic>>("cartItems", cartItemsList);
  }

  void loadCartItems() {
    final cartItemsString =
        MyLocalStorage.instance().readData<List<dynamic>>("cartItems");
    if (cartItemsString != null) {
      cartItems.assignAll(cartItemsString
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList());
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(ProductPackage productPackage) {
    final foundItem = cartItems
        .where((item) => item.productId == productPackage.product.id)
        .fold(0, (previousValue, element) {
      return previousValue + element.quantity;
    });
    return foundItem;
  }

  int getProductVariationQuantityInCart(
      ProductPackage productPackage, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) =>
          item.productId == productPackage.product.id &&
          item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    cartItems.clear();
    updateCart();
  }

  CartItemModel convertToCartItem(ProductPackage productPackage, int quantity) {
    if (!productPackage.product.isVariable) {
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isVariable = variation.id.isNotEmpty;
    final price =
        isVariable ? variation.price : productPackage.product.salePrice;
    return CartItemModel(
      productId: productPackage.product.id,
      variationId: isVariable ? variation.id : '',
      title: productPackage.product.name,
      price: price,
      image: isVariable ? variation.image : productPackage.product.images[0],
      quantity: quantity,
      brandName: productPackage.brand.name,
      selectedVariation: isVariable ? variation.attributeValues.toJson() : null,
    );
  }

  updateAlreadyAddedCount(ProductPackage product) {
    if (!product.product.isVariable) {
      productQuantityInCart.value = getProductQuantityInCart(product);
    } else {
      final variationId = variationController.selectedVariation.value.id;

      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getProductVariationQuantityInCart(product, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }
}
