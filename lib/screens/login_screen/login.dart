import 'package:flutter/material.dart';
import '../../components/back_button_icon.dart';

class loginpage extends StatelessWidget {
  var size,width,height;

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

              button_text(text: "User Login", icon: Icons.login),

              SizedBox(height: height/15,),
              Container(
                child: SizedBox(
                  height: height/10,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "username/email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),

                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  height: height/8,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "password",
                        filled: true,
                        fillColor: Colors.white38,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),

                  ),
                ),
              ),
              Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF000000),
                    backgroundColor: Color(0xFF4cd964),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fixedSize: Size(327,56),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Login",
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xff3737f5),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "forget password",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),//forget password link
              SizedBox(height: height/3.5),
              Container(
                child: Text(
                  "Don't have an account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),//text

              Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: BorderSide(color: Color(0xFF4cd964), width: 5),
                    fixedSize: Size(327,56),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Create Account",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
