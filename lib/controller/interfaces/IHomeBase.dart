import 'package:spacex_latest_launch/model/SpaceXLatestLaunchResponseMessage.dart';

abstract class IHomeBase {
  Future<SpaceXLatestLaunchResponseMessage> getLatestLaunch();
}
