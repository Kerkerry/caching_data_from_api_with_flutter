import 'package:offlineapp/core/helper/log_helper.dart';
import 'package:offlineapp/core/resources/data_state.dart';
import 'package:offlineapp/core/services/di.dart';
import 'package:offlineapp/core/services/di_ex.dart';
import 'package:offlineapp/features/home/data/model/products_model.dart';

class HomeRepository{
  final HomeApiProvider _apiProvider;
  final HomeDbProvider _dbProvider;

  HomeRepository(this._apiProvider, this._dbProvider);

  Future<DataState<dynamic>> fetchProducts()async{
    final bool isConnected=await di<InternetConnectionHelper>().checkInternetConnection();

    final bool isDatabaseEmpty=await _dbProvider.isProductsDataAvailable();

    if(isConnected){
      try {
        final Response response=await _apiProvider.callGetProductsEndpoint();
        if(response.statusCode==200 && response.data['success']==true && (response.data['products'] as List).isNotEmpty){
          ProductsModel productModel=ProductsModel.fromJson(response.data);
          _dbProvider.insertItem(object: productModel);

          final ProductsModel? cachedProducts=await _dbProvider.getProducts();
          return DataSuccess(cachedProducts);
        }else{
          if(!isDatabaseEmpty){
            logger.d("Load products from Local Database");
            final ProductsModel? localSourceReponse=await _dbProvider.getProducts();
            return DataSuccess(localSourceReponse); 
          }
          return const DataFailed("Unkown Error Happened");
        }
      } catch (e) {
        if(!isDatabaseEmpty){
          logger.d("Load [Products] from Local Database");
          final ProductsModel? localSourceResponse=await _dbProvider.getProducts();
          return DataSuccess(localSourceResponse);
        }else{
          return const  DataFailed("Unexpected error happened:");
        }

      }
    }else{
       if(!isDatabaseEmpty){
          logger.d("Load [Products] from Local Database");
          final ProductsModel? localSourceResponse=await _dbProvider.getProducts();
          return DataSuccess(localSourceResponse);
        }else{
          return const DataFailed("No Network Connection!");
        }
   
    }
  }
}