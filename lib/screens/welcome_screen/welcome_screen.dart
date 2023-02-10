import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 250),
        child: PageView(
          children: [
            FittedBox(
              //color: Colors.blueGrey,
              fit: BoxFit.fill,
              //color: Colors.blueGrey,
              child: Image.asset("images/welcome.png"),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 250,
        color: Colors.white,
        child: const Column(
          children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
            'Get The Best floriculture Products',
            textAlign:  TextAlign.center,
            style:  TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,


            ),

        ),
          ),
        ],
      ),
      ),
    );

  }
}

