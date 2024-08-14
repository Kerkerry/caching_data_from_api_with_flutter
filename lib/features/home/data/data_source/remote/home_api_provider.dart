import 'package:dio/dio.dart';
import 'package:offlineapp/config/constants/api_constants.dart';
import 'package:offlineapp/core/helper/log_helper.dart';

class HomeApiProvider{
  final Dio dio;
  const HomeApiProvider(this.dio);

  dynamic callGetProductsEndpoint(){
      final requestUrl=EnvironmentVariables.getProucts;
      final response=dio.request(requestUrl,options: Options(
        method: "GET",
      )).onError((DioException error, stackTrace) {
        logger.e(error);
        throw error;
      });
      return response;
  }
}