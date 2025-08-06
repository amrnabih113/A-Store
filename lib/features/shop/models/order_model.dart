import 'package:a_store/features/shop/models/cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final DateTime orderDate;
  final List<Map<String, dynamic>> items;
  final String status;
  final String paymentMethod;
  final double totalAmount;
  final DateTime? shippingDate;
  final String shippingAddress;
  final String? notes;

  OrderModel({
    required this.id,
    required this.userId,
    required this.orderDate,
    required this.items,
    required this.status,
    required this.paymentMethod,
    required this.totalAmount,
    required this.shippingAddress,
    this.notes,
    this.shippingDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'order_date': orderDate.toIso8601String(),
      'items': items,
      'status': status,
      'payment_method': paymentMethod,
      'total_amount': totalAmount,
      'shipping_date': shippingDate?.toIso8601String(),
      'shipping_address': shippingAddress,
      'notes': notes,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
      items: List<Map<String, dynamic>>.from(json['items']),
      status: json['status'] as String,
      paymentMethod: json['payment_method'] as String,
      totalAmount: json['total_amount'] as double,
      shippingDate: json['shipping_date'] != null
          ? DateTime.parse(json['shipping_date'] as String)
          : null,
      shippingAddress: json['shipping_address'] as String,
      notes: json['notes'] as String?,
    );
  }

  List<CartItemModel> get mappedItems =>
      items.map((item) => CartItemModel.fromJson(item)).toList();
}
