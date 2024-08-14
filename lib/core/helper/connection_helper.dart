import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionHelper {
  Future<bool> checkInternetConnection() async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      return false;
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.vpn ||
        result == ConnectivityResult.ethernet) {
      return true;
    }
    return false;
  }
}
