import 'package:flutter/material.dart';
import '../../components/button_components.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 45, 6),

              child: Text('Get The Best floriculture Products',
                textAlign:  TextAlign.left,
                style:  TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,


                ),

              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 1, 30, 6),
              child: Text(
                'We meet you the greatest floricultural products out of all the individual and mass producers island wide.',
                textAlign:  TextAlign.left,
                style:  TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,


                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 35, 30, 0),
              child: TextButton(
                style: greenButtonStyle,
                onPressed: () { },
                child: const Text(
                  'Let’s Continue',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            )




          ],
        ),

      ),
      );
  }

}
