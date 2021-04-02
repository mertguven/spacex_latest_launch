import 'package:spacex_latest_launch/controller/interfaces/IHomeBase.dart';
import 'package:spacex_latest_launch/model/SpaceXLatestLaunchResponseMessage.dart';
import 'package:spacex_latest_launch/services/web_service.dart';

class HomeController extends IHomeBase {
  WebService _webService = WebService();

  @override
  Future<SpaceXLatestLaunchResponseMessage> getLatestLaunch() async {
    final item = await _webService.sendRequestWithGet("latest");
    var response = SpaceXLatestLaunchResponseMessage.fromJson(item);
    return response;
  }
}
