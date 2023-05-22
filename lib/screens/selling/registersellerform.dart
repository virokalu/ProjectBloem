import "package:flutter/material.dart";

import "../../components/back_button_icon.dart";
import "../../components/button_components.dart";
import "../../components/color_components.dart";

class SellerRegister extends StatefulWidget {
  const SellerRegister({super.key});

  @override
  State<SellerRegister> createState() => _SellerRegisterState();
}

class _SellerRegisterState extends State<SellerRegister> {

  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final conformPassController = TextEditingController();
  final fulNameController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width/30),
          child: Form(
            key: _formField,
            child: ListView(
              children: [
          
                const ButtonText(text: "Registor Seller", icon: Icons.account_circle_outlined),
          
                SizedBox(height: height/30),
                SizedBox(
                  height: height/10,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Preferred Username",
                        filled: true,
                        fillColor: HexColor.fromHex('#F3F1F1'),
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
                  height: height/10,
                  child: TextFormField(
                    controller: fulNameController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_pin_sharp),
                        labelText: "Full Name",
                        filled: true,
                        fillColor: HexColor.fromHex('#F3F1F1'),
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
                  height: height/10,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail_outline_rounded),
                        labelText: "Email",
                        filled: true,
                        fillColor: HexColor.fromHex('#F3F1F1'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),

                    validator: (value){
                      if(value!.isEmpty){
                        return "";
                      }
                      bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                      ).hasMatch(value);

                      if(!emailValid){
                        return "Enter valid email address";
                      }
                      return null;
                    },
          
                  ),
                ),
          
                SizedBox(
                  height: height/10,
                  child: TextFormField(
                    controller: passController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Password",
                        filled: true,
                        fillColor: HexColor.fromHex('#F3F1F1'),
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
                  height: height/10,
                  child: TextFormField(
                    controller: conformPassController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Confirm Password",
                        filled: true,
                        fillColor: HexColor.fromHex('#F3F1F1'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),

                    validator: (value){
                      if(value!.isEmpty){
                        return "Re-Enter Your Password";
                      }
                      else if(passController.text != conformPassController.text){
                        passController.clear();
                        conformPassController.clear();
                        return "Password not confirmed!";
                      }
                      
                      return null;
                    },
          
                  ),
                ),
                TextButton(
                  style: greenButtonStyle,
                  //################################################Create Account#######################################
                  onPressed: () {
                    if(_formField.currentState!.validate()){
                      //print("success");
                      //registerUser(context);


                    }


                  },
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Colors.white, fontSize: 16.0,
                      fontFamily: 'Poppins',),
                  ),
                ),

                SizedBox(height: height / 30),

                const Text(
                  "Already have an account? ",
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
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: HexColor.fromHex('#4CD964'), fontSize: 16.0,
                      fontFamily: 'Poppins',),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}