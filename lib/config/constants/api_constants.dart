class EnvironmentVariables{
  EnvironmentVariables._();
// base Url endpoint
  static String get baseUrl=>"https://api.slingacademy.com";
  // get products
  static String get getProucts=>"$baseUrl/v1/sample-data/products?&limit=30";
}