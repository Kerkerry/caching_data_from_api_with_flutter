import 'package:hive/hive.dart';
import 'package:offlineapp/config/constants/db_keys.dart';
import 'package:offlineapp/core/helper/log_helper.dart';
import 'package:offlineapp/core/repos/interface_repos.dart';
import 'package:offlineapp/features/home/data/model/product_model.dart';
import 'package:offlineapp/features/home/data/model/products_model.dart';

class HomeDatabaseService implements InterfaceRepository<ProductsModel>{
  static const String _key=DbKeys.dbProducts;
  late final Box<ProductsModel> _productsBox;

  Future<void> initDatabase()async{
      try {
        Hive.registerAdapter(ProductsModelAdapter());
        Hive.registerAdapter(ProductModelAdapter());
        _productsBox=await Hive.openBox(_key);
        logger.d("Success on initializing database For *ProductsModel*");
      } catch (e) {
        logger.e("Error initilizing database For *ProductsModel*");
      }
  }

  @override
  Future<ProductsModel?> getAll()async {
    try {
      if(_productsBox.isOpen && _productsBox.isNotEmpty){
          return _productsBox.get(_key);
      }else{
        return null;
      }
    } catch (e) {
      logger.e("Error reading from database: $e");
    }
    return null;
  }

  @override
  Future<void> insertItem({required ProductsModel object})async {
    try {
      await _productsBox.put(_key, object);
    } catch (e) {
      logger.e("Error inserting into datatbase: $e");
    }
  }

  @override
  Future<bool> isDataAvailable() async{
    try {
      return _productsBox.isEmpty;
    } catch (e) {
      logger.e("Error checking if box is empty: $e");
      return true;
    }
  }

}