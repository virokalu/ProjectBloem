import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:project_bloem/screens/place_a_listing/place_a_listing.dart';

import 'components/size.dart';



void main() => runApp(
  DevicePreview(
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(

      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),


      home : const PlaceListing(),

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
