import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';

import '../../components/button_components.dart';
import '../../components/color_components.dart';
import '../../components/size.dart';

class PlaceListing extends StatelessWidget {


  const PlaceListing({super.key});

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

              const BackButtonNHome(),

              SizedBox(height: height/100),

              Text(
                "Add Title",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: height/10,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Title",
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
                      fillColor: Colors.white38,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                      fillColor: Colors.white38,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                      fillColor: Colors.white38,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                      fillColor: Colors.white38,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
