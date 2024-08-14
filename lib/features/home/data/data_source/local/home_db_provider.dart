import 'package:offlineapp/core/helper/log_helper.dart';
import 'package:offlineapp/features/home/data/data_source/local/home_db_service.dart';
import 'package:offlineapp/features/home/data/model/products_model.dart';

class HomeDbProvider{
  final HomeDatabaseService _homeDatabaseService;
  HomeDbProvider({required HomeDatabaseService homeDatabaseService}):_homeDatabaseService=homeDatabaseService;

  Future<ProductsModel?> getProducts()async{
    try {
      return await _homeDatabaseService.getAll();
    } catch (e) {
      logger.e("Error retrieving Products: $e");
      return null;
    }
  }

  Future<void> insertItem({required ProductsModel object})async{
    try {
      await _homeDatabaseService.insertItem(object: object);
    } catch (e) {
      logger.e("Error inserting Products:$e");
    }
  }

  Future<bool> isProductsDataAvailable()async{
    try {
      return _homeDatabaseService.isDataAvailable();
    } catch (e) {
      logger.e("Error checking if box is empty: $e");
      return true;
    }
  }
}