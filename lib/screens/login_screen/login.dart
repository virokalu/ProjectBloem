import 'dart:async';
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
//import 'package:project_bloem/screens/register_form/registerform.dart';
import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';
import '../../components/color_components.dart';
import 'package:project_bloem/models/config.dart';
import 'package:http/http.dart' as http;


  class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    late SharedPreferences preference;


    @override
    void initState(){
      super.initState();
      init();
    }
    Future init() async{
      preference = await SharedPreferences.getInstance();
    }

  final _formField = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();





  Future<void> loginUser(BuildContext context) async {
    final completer = Completer<void>();
    var reqBody = {
      "username": userNameController.text,
      "password": passwordController.text
    };
    var response = await http.post(Uri.parse(login),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(reqBody)
    );
    var jsonResponse = jsonDecode(response.body);


    if(jsonResponse['status']){


      preference.setString('fullname', jsonResponse['fullname']);
      preference.setString('username', jsonResponse['username']);
      preference.setString('token', jsonResponse['token']);



      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        //dialogBackgroundColor: Colors.black,
        animType: AnimType.topSlide,

        showCloseIcon: true,
        title: "Success!",
        desc: "Logged in Successfully",

        btnOkOnPress: () {

          Navigator.pushNamedAndRemoveUntil(context, '/profile',(route)=>false);
          //print("Inside Login");
          completer.complete();
        },
        btnOkText: "OK",

        btnOkColor: HexColor.fromHex('#4CD964'),
      ).show();
      // Redirect to previous screen or home screen
      // ignore: use_build_context_synchronously
      //Navigator.pop(context);


    }else if(!jsonResponse['status']){
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        //dialogBackgroundColor: Colors.black,
        animType: AnimType.topSlide,

        showCloseIcon: true,
        title: "Incorrect Username/Password",
        desc: "Incorrect Username/Password, Please Try Again!",

        btnOkOnPress: (){

          userNameController.clear();
          passwordController.clear();

          //print("Inside Login");
          completer.complete();
        },
        btnOkText: "OK",

        btnOkColor: HexColor.fromHex('#4CD964'),
      ).show();
      return completer.future;
    }
  }





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
        child: Form(
          key: _formField,
          child: ListView(
            children: [
        
              const ButtonText(text: "User Login", icon: Icons.login),
        
              SizedBox(height: height / 30,),
              SizedBox(
                height: height / 10,
                child: TextFormField(
                  controller: userNameController,
                  //###############################################usernameform##################################
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: "Username",
                      filled: true,
                      fillColor: Colors.white38,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),

                  validator: (value){
                      if(value!.isEmpty){
                        return "";
                      }
                      
                      return null;
                    },
        
                ),
              ),
              SizedBox(
                height: height / 10,
                child: TextFormField(
                  controller: passwordController,
                  //############################################password#############################################
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: "Password",
                      filled: true,
                      fillColor: Colors.white38,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),

                  validator: (value){
                      if(value!.isEmpty){
                        return "";
                      }
                      
                      return null;
                    },
        
                ),
              ),
              TextButton(
                style: greenButtonStyle,
                //################################################login#######################################
                onPressed: () {
                  if(_formField.currentState!.validate()){
                    loginUser(context);
                  }
                },
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
                onPressed: (){



                },
                child: const Text(
                  "Forget Password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ), //forget password link
        
              SizedBox(height: height / 6),
        
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

                  Navigator.pushNamed(context, '/register');
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
      ),
    );
  }


}

