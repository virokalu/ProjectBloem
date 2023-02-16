import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';

import '../../components/button_components.dart';
import '../../components/color_components.dart';

class RegisterPage extends StatelessWidget {


  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width/30),
          child: ListView(
            children: [

              const ButtonText(text: "Create Account", icon: Icons.account_circle_outlined),

              SizedBox(height: height/30),
              SizedBox(
                height: height/10,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: "preferred username",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      )
                  ),

                ),
              ),

              SizedBox(
                height: height/10,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_pin_sharp),
                      labelText: "Full Name",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      )
                  ),

                ),
              ),

              SizedBox(
                height: height/10,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail_outline_rounded),
                      labelText: "Email",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      )
                  ),

                ),
              ),

              SizedBox(
                height: height/10,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: "password",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      )
                  ),

                ),
              ),

              SizedBox(
                height: height/10,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: "Confirm Password",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      )
                  ),

                ),
              ),
              TextButton(
                style: greenButtonStyle,
                //################################################Create Account#######################################
                onPressed: () {},
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white, fontSize: 16.0,
                    fontFamily: 'Poppins',),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
