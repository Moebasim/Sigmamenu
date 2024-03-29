import 'dart:convert';
import 'package:sigmamenu/GeneralFunction/random_id_generator.dart';
import 'package:sigmamenu/models/rating.dart';

class Product {
  String id = generateId();
  double price = 0.00;
  String image = 'assets/images/placeholder.jpg';
  String nameEn = 'productNameEn';
  String nameAr = 'productNameAr';
  String category = 'category';
  String subCategory = 'subCategory';
  String superCategory = 'superCategory';
  String descriptionEn = 'descriptionEn';
  String descriptionAr = 'descriptionAr';
  bool isPublished = true;
  bool isOnSale = false;
  Rating rating = Rating();
  int weight = 0;
  Map<String, dynamic> options1 = {};
  Map<String, dynamic> options2 = {};
  Map<String, dynamic> options3 = {};

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weight': weight,
      'price': double.tryParse(price.toString()) ?? 0.00,
      'image': image,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'category': category,
      'subCategory': subCategory,
      'superCategory': superCategory,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'isPublished': isPublished,
      'isOnSale': isOnSale,
      'options1': options1,
      'options2': options2,
      'options3': options3,
    };
  }

  Map<String, dynamic> createNewProduct() {
    return {
      'id': id,
      'weight': weight,
      'quantity': double.tryParse(price.toString()) ?? 0.00,
      'price': double.tryParse(price.toString()) ?? 0.00,
      'image': image,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'category': category,
      'subCategory': subCategory,
      'superCategory': superCategory,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'isPublished': isPublished,
      'isOnSale': isOnSale,
      'rating': rating.toMap(),
      'options1': options1,
      'options2': options2,
      'options3': options3,
    };
  }

  Product.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        weight = map['weight'] ?? 0,
        price = double.tryParse(map['price'].toString()) ?? 0.00,
        image = map['image'] ?? '',
        nameEn = map['nameEn'] ?? '',
        nameAr = map['nameAr'] ?? '',
        category = map['category'] ?? '',
        subCategory = map['subCategory'] ?? '',
        superCategory = map['superCategory'] ?? '',
        descriptionEn = map['descriptionEn'] ?? '',
        descriptionAr = map['descriptionAr'] ?? '',
        isPublished = map['isPublished'] ?? true,
        isOnSale = map['isOnSale'] ?? false,
        rating =
            map['rating'] != null ? Rating.fromMap(map['rating']) : Rating(),
        options1 = map['options1'],
        options2 = map['options2'],
        options3 = map['options3'];

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(price: $price, image: $image, nameEn: $nameEn, nameAr: $nameAr, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.price == price &&
        other.image == image &&
        other.weight == weight &&
        other.nameEn == nameEn &&
        other.nameAr == nameAr &&
        other.category == category &&
        other.subCategory == subCategory &&
        other.superCategory == superCategory &&
        other.descriptionEn == descriptionEn &&
        other.descriptionAr == descriptionAr &&
        other.isPublished == isPublished &&
        other.isOnSale == isOnSale &&
        other.options1 == options1 &&
        other.options2 == options2 &&
        other.options3 == options3;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        price.hashCode ^
        weight.hashCode ^
        image.hashCode ^
        nameEn.hashCode ^
        nameAr.hashCode ^
        category.hashCode ^
        superCategory.hashCode ^
        subCategory.hashCode ^
        descriptionEn.hashCode ^
        descriptionAr.hashCode ^
        isPublished.hashCode ^
        isOnSale.hashCode ^
        options1.hashCode ^
        options2.hashCode ^
        options3.hashCode;
  }
}
