class GlobalVariables {
  static final String _routePrefix = "https://api.spacexdata.com/v4/launches/";

  static String baseUrl(String route) {
    return "$_routePrefix$route";
  }
}
