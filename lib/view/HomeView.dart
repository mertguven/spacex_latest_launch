import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex_latest_launch/controller/HomeController.dart';
import 'package:spacex_latest_launch/model/SpaceXLatestLaunchResponseMessage.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SpaceXLatestLaunchResponseMessage>(
      future: _getLatestLaunch(),
      builder: (context, response) {
        return response.hasData
            ? Scaffold(
                bottomNavigationBar: BottomAppBar(
                  elevation: 7,
                  color: response.data.success ? Colors.lightGreen : Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      response.data.success ? "Success" : "Failed",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.7],
                      colors: [
                        Color(0xff080b10),
                        Color(0xff161f2a),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Image.network(
                                response.data.links.patch.small,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(bottom: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  response.data.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Falcon 9",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text(
                              response.data.details,
                              textAlign: TextAlign.justify,
                              style: context.textTheme.headline5,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date",
                                  style: context.textTheme.headline6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${DateTime.parse(response.data.dateUtc).day}/${DateTime.parse(response.data.dateUtc).month}/${DateTime.parse(response.data.dateUtc).year}",
                                      style: context.textTheme.headline6,
                                    ),
                                    Text(
                                      "${DateTime.parse(response.data.dateUtc).hour}:${DateTime.parse(response.data.dateUtc).minute}",
                                      style: context.textTheme.headline6,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Social",
                                  style: context.textTheme.headline6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    3,
                                    (index) => socialButtons(response, index),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          response.data.links.youtubeId != null
                              ? Padding(
                                  padding: EdgeInsets.only(bottom: 30),
                                  child: YoutubePlayer(
                                    showVideoProgressIndicator: false,
                                    thumbnail: Image.network(
                                        "http://i3.ytimg.com/vi/a15czI9B91c/hqdefault.jpg"),
                                    controller: YoutubePlayerController(
                                        flags: YoutubePlayerFlags(
                                            autoPlay: false,
                                            hideThumbnail: true),
                                        initialVideoId:
                                            response.data.links.youtubeId),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Scaffold(
                body: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.7],
                      colors: [
                        Color(0xff080b10),
                        Color(0xff161f2a),
                      ],
                    ),
                  ),
                  child: Center(
                      child: FractionallySizedBox(
                          widthFactor: 0.5,
                          child:
                              Lottie.asset("assets/animations/loading.json"))),
                ),
              );
      },
    );
  }

  IconButton socialButtons(
      AsyncSnapshot<SpaceXLatestLaunchResponseMessage> response, int index) {
    return IconButton(
      icon: Icon(index == 0
          ? FontAwesomeIcons.newspaper
          : index == 1
              ? FontAwesomeIcons.wikipediaW
              : FontAwesomeIcons.globeAmericas),
      color: Colors.white,
      onPressed: () => goToLink(index == 0
          ? response.data.links.article
          : index == 1
              ? response.data.links.wikipedia
              : "https://www.spacex.com"),
    );
  }

  Future<SpaceXLatestLaunchResponseMessage> _getLatestLaunch() async {
    var homeController = Provider.of<HomeController>(context, listen: false);
    var response = await homeController.getLatestLaunch();
    return response;
  }

  goToLink(String link) async {
    await canLaunch(link)
        ? await launch(link)
        : customSnackbar("Please try again later");
  }

  customSnackbar(String content) {
    Get.snackbar(null, null,
        margin: EdgeInsets.all(15),
        duration: Duration(seconds: 5),
        borderRadius: 7,
        messageText: Text(
          content,
          style: context.textTheme.headline5,
        ),
        icon: Icon(Icons.info, size: 28.0, color: Colors.white),
        backgroundColor: Color(0xffD64565),
        snackPosition: SnackPosition.TOP);
  }
}
