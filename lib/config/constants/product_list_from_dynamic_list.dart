import 'package:offlineapp/features/home/data/model/product_model.dart';

class ProductListFromDynamicList {
  static fromDynamicList(List products) => products
      .map((product) => ProductModel(
          id: product['id'],
          price: product['price'],
          category: product['category'],
          updatedAt: DateTime.parse(product['updated_at']),
          photoUrl: product['photo_url'],
          name: product['name'],
          description: product['description'],
          createdAt: DateTime.parse(product['created_at'])))
      .toList();
}
