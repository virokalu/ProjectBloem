import 'dart:async';
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
//import 'package:project_bloem/screens/register_form/registerform.dart';
import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';
import '../../components/color_components.dart';
import 'package:project_bloem/config.dart';
import 'package:http/http.dart' as http;

import 'loginuserdetails.dart';


  class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {

    bool show = true;
    @override
    void initState(){
      super.initState();
    }

  final _formField = GlobalKey<FormState>();
  final passwordController = TextEditingController();


  Future<void> loginAdmin(BuildContext context) async {
    final completer = Completer<void>();
    var reqBody = {
      "password": passwordController.text,
      "username" : "admin",
    };
    var response = await http.post(Uri.parse(login),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(reqBody)
    );
    var jsonResponse = jsonDecode(response.body);

    if(jsonResponse['status']){
          Navigator.pushNamedAndRemoveUntil(context, '/adminpage',(route)=>false);
          //print("Inside Login");
          completer.complete();
  
    }else if(!jsonResponse['status']){
          show = false;
    }
  }





  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var height = size.height;
    var width = size.width;
    bool _isObscure = true;
    return Scaffold(
      //backgroundColor: Colors.white,


      body: Container(
        margin: EdgeInsets.all(width / 30),
        child: Form(
          key: _formField,
          child: ListView(
            children: [
        
              const ButtonTextLogin(text: "Admin Login", icon: Icons.login),
        
              SizedBox(height: height / 30,),
              
              SizedBox(
                height: height / 10,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  //############################################password#############################################
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: "Password",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                          //borderSide: BorderSide.none
                      )
                  ),

                  validator: (value){
                      if(value!.isEmpty){
                        return "Required";
                      }
                      
                      return null;
                    },
        
                ),
              ),

              show ? const Text(
                "",
                style: TextStyle(
                  color: Colors.green,
                ),)
              : const Text(
                "try again !",
                style: TextStyle(
                  color: Colors.red,
                ),),
              TextButton(
                style: greenButtonStyle,
                //################################################login#######################################
                onPressed: () {
                  if(_formField.currentState!.validate()){
                    setState(() {
                      loginAdmin(context);
                    });
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 16.0,
                    fontFamily: 'Poppins',),
                ),
              ),
        
              SizedBox(height: height / 6),
        
              
            ],
          ),
        ),
      ),
    );
  }


}

