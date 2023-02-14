import 'package:flutter/material.dart';
import 'package:project_bloem/screens/register_form/registerform.dart';
import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';
import '../../components/color_components.dart';

class LoginPage extends StatelessWidget {


  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      //backgroundColor: Colors.white,


      body: Container(
        margin: EdgeInsets.all(width / 30),
        child: ListView(
          children: [

            const ButtonText(text: "User Login", icon: Icons.login),

            SizedBox(height: height / 30,),
            SizedBox(
              height: height / 10,
              child: TextFormField(
                //###############################################usernameform##################################
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: "username/email",
                    filled: true,
                    fillColor: Colors.white38,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),

              ),
            ),
            SizedBox(
              height: height / 10,
              child: TextFormField(
                //############################################password#############################################
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: "password",
                    filled: true,
                    fillColor: Colors.white38,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),

              ),
            ),
            TextButton(
              style: greenButtonStyle,
              //################################################login#######################################
              onPressed: () {},
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16.0,
                  fontFamily: 'Poppins',),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                ),
              ),
              //#################################################need to navigate to forget password#########
              onPressed: () {},
              child: const Text(
                "Forget password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ), //forget password link
            SizedBox(height: height / 4),
            const Text(
              "Don't have an account ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
              ),
            ), //text

            TextButton(
              style: greenButtonBorderStyle,
              //############################navigate to registration form##########################################
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: Text(
                "Create Account",
                style: TextStyle(
                  color: HexColor.fromHex('#4CD964'), fontSize: 16.0,
                  fontFamily: 'Poppins',),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }

