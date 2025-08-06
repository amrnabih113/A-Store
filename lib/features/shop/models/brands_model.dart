class BrandsModel {
  final int id;
  final String name;
  final String image;
  final int productsCount;
  final int categoryId;

  BrandsModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.productsCount,
      required this.categoryId});

  static BrandsModel empty() => BrandsModel(
      id: 0,
      name: "",
      image: "",
      productsCount: 0,
      categoryId: 0);

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      productsCount: json['products_count'],
      categoryId: json['category_id']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "products_count": productsCount,
        "category_id": categoryId,
      };

}
