import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:project_bloem/screens/welcome_screen/welcome_screen.dart';


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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),

      home : const WelcomeScreen(),
    );
  }
}
