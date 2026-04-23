import 'package:e_commerce_flutter/src/core/app_data.dart';
import 'package:e_commerce_flutter/src/model/product_size_type.dart';

enum ProductType { all, watch, mobile, headphone, tablet, tv }

class Product {
  String id;
  String name;
  String? description;
  double price;
  double? discountPrice;
  int quantity;
  String? imageUrl;
  String? category;
  bool isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  // Local fields for UI
  ProductSizeType? sizes;
  String about;
  bool isAvailable;
  int _cartQuantity;
  List<String> images;
  bool isFavorite;
  double rating;
  ProductType type;

  int get cartQuantity => _cartQuantity;

  set cartQuantity(int newQuantity) {
    if (newQuantity >= 0) _cartQuantity = newQuantity;
  }

  Product({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.discountPrice,
    required this.quantity,
    this.imageUrl,
    this.category,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    this.sizes,
    this.about = AppData.dummyText,
    this.isAvailable = true,
    int cartQuantity = 0,
    this.images = const [],
    this.isFavorite = false,
    this.rating = 4.0,
    this.type = ProductType.all,
  }) : _cartQuantity = cartQuantity;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      discountPrice: json['discount_price'] != null
          ? (json['discount_price'] as num).toDouble()
          : null,
      quantity: json['quantity'] ?? 0,
      imageUrl: json['image_url'],
      category: json['category'],
      isActive: json['is_active'] ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount_price': discountPrice,
      'quantity': quantity,
      'image_url': imageUrl,
      'category': category,
      'is_active': isActive,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

