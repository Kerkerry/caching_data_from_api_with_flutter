import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offlineapp/config/constants/product_list_from_dynamic_list.dart';
import 'package:offlineapp/features/home/data/hive_helper/fields/products_model_fields.dart';
import 'package:offlineapp/features/home/data/hive_helper/hive_types.dart';
import 'package:offlineapp/features/home/data/model/product_model.dart';
part 'products_model.g.dart';
@HiveType(typeId:HiveTypes.productsModel)
class ProductsModel extends HiveObject {
  @HiveField(ProductsModelFields.success)
  final bool success;
  @HiveField(ProductsModelFields.totalProducts)
  final int totalProducts;
  @HiveField(ProductsModelFields.message)
  final String message;
  @HiveField(ProductsModelFields.offset)
  final int offset;
  @HiveField(ProductsModelFields.limit)
  final int limit;
  @HiveField(ProductsModelFields.products)
  final List<ProductModel> products;

  ProductsModel(
      {required this.success,
      required this.totalProducts,
      required this.message,
      required this.offset,
      required this.limit,
      required this.products});

  factory ProductsModel.fromJson(Map<String, dynamic> json){
    
    return ProductsModel(
      success: json['success'],
      totalProducts: json['total_products'],
      message: json['message'],
      offset: json['offset'],
      limit: json['limit'],
      products: ProductListFromDynamicList.fromDynamicList(json['products']));
  }
}

