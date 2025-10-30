import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductModel {
  String id;
  String name;
  String brandName;
  double price;
  String description;
  String status;
  int discount;
  RxBool isWishListed = false.obs; // ✅ made observable

  ProductModel({
    required this.id,
    required this.name,
    required this.brandName,
    required this.price,
    required this.description,
    required this.status,
    required this.discount,
    bool isWishListed = false,
  }) {
    this.isWishListed.value = isWishListed;
  }

  /// Factory method to create a ProductModel from a Firebase document snapshot.
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ProductModel(
        id: document.id,
        name: data['name'] ?? '',
        brandName: data['brand_name'] ?? '',
        price: (data['price'] ?? 0.0).toDouble(),
        description: data['description'] ?? '',
        status: data['status'] ?? '',
        discount: (data['discount'] ?? 0).toInt(),
        isWishListed: false,
      );
    } else {
      return ProductModel.empty();
    }
  }

  static ProductModel empty() => ProductModel(
    id: '',
    name: '',
    brandName: '',
    price: 0.0,
    description: '',
    status: '',
    discount: 0,
    isWishListed: false,
  );
}
