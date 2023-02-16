import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
//import 'package:project_bloem/screens/login_screen/login.dart';
import 'package:project_bloem/screens/selling/selling_page.dart';
//import 'package:project_bloem/screens/homo_screen/home_screen.dart';
//import 'package:project_bloem/screens/selling/selling_page.dart';
//import 'package:project_bloem/screens/user_profile/profile.dart';



void main() => runApp(
  DevicePreview(
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),


      home : const SellingPage(),

    );

  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
