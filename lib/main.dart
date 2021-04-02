import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_latest_launch/controller/HomeController.dart';
import 'package:spacex_latest_launch/view/HomeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeController>(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        title: 'SpaceX Latest Launch',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            headline5: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        home: HomeView(),
      ),
    );
  }
}
