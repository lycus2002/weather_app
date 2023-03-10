import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/home/home_screen.dart';
import 'package:weather_app/pages/home/login.dart';
import 'package:weather_app/utils/Binding/HomeBinding.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "LoginPage",
      routes: {
        "LoginPage": (context)=> LoginPage(),
      },

      getPages: [
        GetPage(
          name: '/',
          page: () =>LoginPage(),
          binding: HomeBinding(),

        )
      ],
    );
  }
}

/*
*
* */
