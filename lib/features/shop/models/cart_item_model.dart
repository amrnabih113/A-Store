class CartItemModel {
  final int productId;
  final String title;
  final double price;
  final String? image;
 int quantity;
  final String variationId;
  final String? brandName;
  final Map<String, dynamic>? selectedVariation;

  CartItemModel({
    required this.productId,
    required this.title,
    this.price = 0.0,
    this.image,
    required this.quantity,
    this.variationId = '',
    this.brandName,
    this.selectedVariation,
  });

  CartItemModel.empty()
      : productId = 0,
        title = '',
        price = 0.0,
        image = '',
        quantity = 0,
        variationId = '',
        brandName = '',
        selectedVariation = <String, dynamic>{};

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }
  
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price']?.toDouble() ?? 0.0,
      image: json['image'],
      quantity: json['quantity'],
      variationId: json['variationId'] ?? '',
      brandName: json['brandName'],
      selectedVariation: json['selectedVariation'],
    );
  }
}

