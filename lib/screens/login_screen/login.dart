import 'package:flutter/material.dart';
import '../../components/back_button_icon.dart';

class LoginPage extends StatelessWidget {
  var size,width,height;

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width/30),
          child: ListView(
            children: [

              ButtonText(text: "User Login", icon: Icons.login),

              SizedBox(height: height/15,),
              SizedBox(
                height: height/10,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: "username/email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),

                ),
              ),
              SizedBox(
                height: height/8,
                child: TextFormField(
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
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF000000),
                  backgroundColor: const Color(0xFF4cd964),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fixedSize: const Size(327,56),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Login",
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xff3737f5),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "forget password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),//forget password link
              SizedBox(height: height/3.5),
              const Text(
                "Don't have an account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),//text

              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: const BorderSide(color: Color(0xFF4cd964), width: 5),
                  fixedSize: const Size(327,56),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Create Account",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
