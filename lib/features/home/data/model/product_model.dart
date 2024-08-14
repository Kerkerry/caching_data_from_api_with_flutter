
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offlineapp/features/home/data/hive_helper/fields/product_fields.dart';
import 'package:offlineapp/features/home/data/hive_helper/hive_types.dart';
part 'product_model.g.dart';
@HiveType(typeId:HiveTypes.product)
class ProductModel extends HiveObject{
  @HiveField(ProductFields.id)
  final int id;
  @HiveField(ProductFields.price)
  final double price;
  @HiveField(ProductFields.category)
  final String category;
  @HiveField(ProductFields.updatedAt)
  final DateTime updatedAt;
  @HiveField(ProductFields.photoUrl)
  final String photoUrl;
  @HiveField(ProductFields.name)
  final String name;
  @HiveField(ProductFields.description)
  final String description;
  @HiveField(ProductFields.createdAt)
  final DateTime createdAt;

  ProductModel(
      {required this.id,
      required this.price,
      required this.category,
      required this.updatedAt,
      required this.photoUrl,
      required this.name,
      required this.description,
      required this.createdAt});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      price: json['price'],
      category: json['category'],
      updatedAt: json['updatedAt'],
      photoUrl: json['photoUrl'],
      name: json['name'],
      description: json['description'],
      createdAt: json['createdAt']);
}
