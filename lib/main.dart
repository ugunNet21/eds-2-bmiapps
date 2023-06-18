import 'package:bionotes/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';
import 'pages/input_page.dart';
import 'pages/result_page.dart';


void main() {
  Get.put(HomeController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: ()=> SplashSceen()),
      GetPage(name: '/input', page: ()=> InputPage()),
      GetPage(name: '/result', page: () => ResultPage()),
    ],
  ));
}