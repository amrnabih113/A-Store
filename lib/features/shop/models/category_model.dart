import 'package:translator/translator.dart'; // Import the translator package

class CategoryModel {
  final int? id;
  final String name;
  final String image;
  final bool isFeatured;
  final String parentId;

  CategoryModel({
    this.id,
    required this.name,
    required this.image,
    this.isFeatured = false,
    required this.parentId,
  });

  static CategoryModel empty() => CategoryModel(
        name: "",
        image: "",
        isFeatured: false,
        parentId: "",
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      isFeatured: json['is_featured'],
      parentId: json['parent_category_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "is_featured": isFeatured,
        "parent_category_id": parentId,
      };

}

class CategoryTranslator {
  final translator = GoogleTranslator();

  Future<List<CategoryModel>> translateCategories(
      List<CategoryModel> categories) async {
    List<CategoryModel> translatedCategories = [];

    for (var category in categories) {
      String translatedName =
          (await translator.translate(category.name, to: 'ar')).text;

      CategoryModel translatedCategory = CategoryModel(
        id: category.id,
        name: translatedName,
        image: category.image,
        isFeatured: category.isFeatured,
        parentId: category.parentId,
      );

      translatedCategories.add(translatedCategory);
    }

    return translatedCategories;
  }
}
