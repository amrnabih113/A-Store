
import 'package:a_store/features/shop/models/brands_model.dart';
import 'package:a_store/features/shop/models/category_model.dart';
import 'package:a_store/features/shop/models/product_model.dart';

class ProductPackage {
  final ProductModel product;
  final CategoryModel category;
  final BrandsModel brand;

  ProductPackage( 
      {required this.product, required this.category, required this.brand});

  factory ProductPackage.empty() => ProductPackage(
      product: ProductModel.empty(),
      category: CategoryModel.empty(),
      brand: BrandsModel.empty());
}
