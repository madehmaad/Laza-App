// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class product_model {
  int id;
  String title;
  String description;
  num price;
  String thumbnail;
  String brand;
  String category;
  List images;
  product_model({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.brand,
    required this.category,
    required this.images,
  });

  product_model copyWith({
    int? id,
    String? title,
    String? description,
    num? price,
    String? thumbnail,
    String? brand,
    String? category,
    List? images,
  }) {
    return product_model(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'thumbnail': thumbnail,
      'brand': brand,
      'category': category,
      'images': images,
    };
  }

  factory product_model.fromMap(Map<String, dynamic> map) {
    return product_model(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
      thumbnail: map['thumbnail'] as String,
      brand: map['brand'] as String,
      category: map['category'] as String,
      images: List.from((map['images'] as List),
    ));
  }

  String toJson() => json.encode(toMap());

  factory product_model.fromJson(String source) =>
      product_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'product_model(id: $id, title: $title, description: $description, price: $price, thumbnail: $thumbnail, brand: $brand, category: $category, images: $images)';
  }

  @override
  bool operator ==(covariant product_model other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.thumbnail == thumbnail &&
        other.brand == brand &&
        other.category == category &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        thumbnail.hashCode ^
        brand.hashCode ^
        category.hashCode ^
        images.hashCode;
  }
}
