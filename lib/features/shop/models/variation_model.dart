class ProductVariationModel {
  final String id;
  final String image;
  final double price;
  final int stock;
  final AttributeValues attributeValues;

  ProductVariationModel({
    required this.id,
    required this.image,
    required this.price,
    required this.stock,
    required this.attributeValues,
  });

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    return ProductVariationModel(
      id: json['id'],
      image: json['image'],
      price: double.parse(json['price']),
      stock: json['stock'],
      attributeValues: AttributeValues.fromJson(json[
          'attribute_values']), 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'price': price.toString(),
      'stock': stock,
      'attribute_values': attributeValues.toJson(),
    };
  }

  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        image: '',
        price: 0.0,
        stock: 0,
        attributeValues: AttributeValues.empty(),
      );
}

class AttributeValues {
  final Map<String, String> values;

  AttributeValues({required this.values});

  factory AttributeValues.fromJson(Map<String, dynamic> json) {
    return AttributeValues(
      values: Map<String, String>.from(json),
    );
  }

  Map<String, dynamic> toJson() {
    return values;
  }

  static AttributeValues empty() => AttributeValues(values: {});


}
