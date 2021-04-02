import 'dart:convert';
import 'package:spacex_latest_launch/utilities/GlobalVariables.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<dynamic> sendRequestWithGet(String url) async {
    var result = await http.get(Uri.parse(GlobalVariables.baseUrl(url)));
    var jsonResponse = json.decode(result.body);
    return jsonResponse;
  }
}
