import 'package:flutter/material.dart';
import 'package:project_bloem/screens/welcome_screen/welcome_screen.dart';

void main() {
  return runApp( MaterialApp(home: MyApp()), // use MaterialApp
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const WelcomeScreen();

  }
}
