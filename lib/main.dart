import 'package:flutter/material.dart';
import 'package:project_bloem/screens/login_screen/login.dart';
import 'package:device_preview/device_preview.dart';
import 'package:project_bloem/screens/resetpassword/restpassword.dart';
import 'package:project_bloem/screens/user_profile/profile.dart';


void main() => runApp(
  DevicePreview(
    builder: (context) => MyApp(), // Wrap your app
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

      home : UserProfile(),
    );
  }
}
