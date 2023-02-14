import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_bloem/screens/login_screen/login.dart';
//import 'package:project_bloem/screens/register_form/registerform.dart';
import 'package:project_bloem/screens/welcome_screen/welcome_screen.dart';
import 'package:device_preview/device_preview.dart';


void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home : LoginPage(),
    );
  }
}
