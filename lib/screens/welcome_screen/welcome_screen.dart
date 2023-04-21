import 'package:flutter/material.dart';
import 'package:project_bloem/screens/homo_screen/home_screen.dart';
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        child: Container(
          alignment: Alignment.center,
          //padding: const EdgeInsets.only(bottom: 250),
          child: PageView(
            children: [
              FittedBox(
                //color: Colors.blueGrey,
                fit: BoxFit.fitWidth,
                //color: Colors.blueGrey,
                child: Image.asset("images/welcome.png"),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 6),
              child: SizedBox(
                width: 350.0,
                child: Text(
                  'Get The Best Floriculture Products',
                  textAlign:  TextAlign.left,
                  style:  TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),

                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 1, 30, 6),
              child: SizedBox(
                width: 350.0,
                child: Text(
                  'We meet you the greatest floricultural products out of all the individual and mass producers island wide.',
                  textAlign:  TextAlign.left,
                  style:  TextStyle(

                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 35, 30, 0),
              child: TextButton(
                style: greenButtonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                //###########################################fuction need to add here##########################################
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
