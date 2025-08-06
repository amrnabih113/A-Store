import 'package:a_store/features/shop/models/attributes_model.dart';
import 'package:a_store/features/shop/models/variation_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final int categoryId;
  final int brandId;
  final int stock;
  final bool isVariable;
  final double discountPercentage;
  final List<AttributesModel> attributes;
  final List<ProductVariationModel> variations;
  final String createdAt;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.images,
      required this.categoryId,
      required this.brandId,
      required this.stock,
      required this.isVariable,
      required this.discountPercentage,
      required this.attributes,
      required this.variations,
      required this.createdAt});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      name: json["title"],
      description: json["description"],
      price: json["price"].toDouble(),
      images: List<String>.from(json["images"].map((x) => x)),
      categoryId: json["category_id"],
      brandId: json["brand_id"],
      stock: json["stock"],
      isVariable: json["is_variable"],
      discountPercentage: json["discount_percentage"].toDouble(),
      attributes: List<AttributesModel>.from(
          json["attributes"].map((x) => AttributesModel.fromJson(x))),
      variations: List<ProductVariationModel>.from(json["product_variations"]
          .map((x) => ProductVariationModel.fromJson(x))),
      createdAt: json["created_at"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": name,
        "description": description,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x)),
        "category_id": categoryId,
        "brand_id": brandId,
        "stock": stock,
        "is_variable": isVariable,
        "discount_percentage": discountPercentage,
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "product_variations":
            List<dynamic>.from(variations.map((x) => x.toJson())),
        "created_at": createdAt
      };

  static ProductModel empty() => ProductModel(
        id: 0,
        name: "",
        description: "",
        price: 0.0,
        images: [],
        categoryId: 0,
        brandId: 0,
        stock: 0,
        isVariable: false,
        discountPercentage: 0.0,
        attributes: [],
        variations: [],
        createdAt: "",
      );

  get salePrice => price - (price * discountPercentage / 100);
}
