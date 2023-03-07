import 'package:flutter/material.dart';
//import 'package:project_bloem/screens/register_form/registerform.dart';
import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';
import '../../components/color_components.dart';


  class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formField = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();



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
                      labelText: "Username/Email",
                      filled: true,
                      fillColor: Colors.white38,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),

                  validator: (value){
                      if(value!.isEmpty){
                        return "Enter Username";
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
                        return "Enter Password";
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
                    userNameController.clear();
                    passwordController.clear();
                    Navigator.pushNamed(context, '/home');
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
                onPressed: () {

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

