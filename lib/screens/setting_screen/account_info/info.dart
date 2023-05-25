import 'dart:async';
import 'dart:convert';
//import 'dart:html';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';
import 'package:project_bloem/components/button_components.dart';
import 'package:project_bloem/components/color_components.dart';
//import 'package:project_bloem/screens/login_screen/login.dart';

//import '../../components/button_components.dart';
import 'package:http/http.dart' as http;
import 'package:project_bloem/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../../components/color_components.dart';

class UpdateDetails extends StatefulWidget {
  const UpdateDetails({super.key});

  @override
  State<UpdateDetails> createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<UpdateDetails> {
  late SharedPreferences preference;

  String? username;
  String? fullname;
  String? email;
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final fulNameController = TextEditingController();
  bool passToggle = true;

  @override
  void initState(){
    super.initState();
    init();
  }
  Future init() async{
    preference = await SharedPreferences.getInstance();
    String? fullname=preference.getString('fullname');
    String? username=preference.getString('username');
    String? email=preference.getString('email');

    setState(() =>nameController.text=username!);
    setState(() =>this.username=username!);
    setState(() =>this.fullname=fullname!);
    setState(() =>this.email=email!);
    setState(() =>fulNameController.text=fullname!);
    setState(() =>emailController.text=email!);


  }

  Future<void> updateUser(BuildContext context) async {
    final completer = Completer<void>();
    var updateBody = {
      "username": username,
      "newusername": nameController.text,
      "fullname": fulNameController.text,
      "email": emailController.text,
    };
    //print(registration);
    var response = await http.post(Uri.parse(update),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode(updateBody));
    var jsonResponse = jsonDecode(response.body);
    //print(jsonResponse['status']);
    if (jsonResponse['status']) {
      preference.setString('fullname', jsonResponse['fullname']);
      preference.setString('username', jsonResponse['username']);
      preference.setString('email', jsonResponse['email']);
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        //dialogBackgroundColor: Colors.black,
        animType: AnimType.topSlide,

        showCloseIcon: true,
        title: "Success!",
        desc: "Registered Successfully",

        btnOkOnPress: () {

          Navigator.pushNamed(context, '/profile');
          //print("Inside Login");
          completer.complete();
        },
        btnOkText: "OK",

        btnOkColor: HexColor.fromHex('#4CD964'),
      ).show();
    } else if (!jsonResponse['status']) {
      var myEmail = "email";
      var myUser = "user";
      if (jsonResponse['exist'].contains(myEmail)) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          //dialogBackgroundColor: Colors.black,
          animType: AnimType.topSlide,

          showCloseIcon: true,
          title: "Email Already Exist",
          desc:
              "${emailController.text} Already in use. Please Try Another or Login",
          btnCancelOnPress: () {
            emailController.clear();
            completer.complete();
          },
          // btnOkOnPress: () {
          //   Navigator.pushNamed(context, '/login');
          //
          //   //print("Inside Login");
          //   completer.complete();
          // },
          // btnOkText: "Login",
          btnCancelText: "OK",
          btnOkColor: HexColor.fromHex('#4CD964'),
        ).show();
        return completer.future;

        //print(jsonResponse['exist']);
      } else if (jsonResponse['exist'].contains(myUser)) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.topSlide,
          showCloseIcon: true,
          title: "Username Already Exist",
          desc:
              "${nameController.text} is Already in Use Please try Another One",
          btnCancelOnPress: () {
            nameController.clear();
          },
          btnCancelText: "OK",
          btnCancelColor: HexColor.fromHex('#4CD964'),
        ).show();
        return completer.future;
        //print(jsonResponse['exist']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width / 30),
          child: Form(
            key: _formField,
            child: ListView(
              children: [
                const ButtonText(
                    text: "Update Profile",
                    icon: Icons.account_circle_outlined),
                SizedBox(height: height / 30),
                SizedBox(
                  height: height / 10,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Preferred Username",
                        filled: true,
                        fillColor: HexColor.fromHex('#F3F1F1'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 10,
                  child: TextFormField(
                    controller: fulNameController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_pin_sharp),
                        labelText: "Full Name",
                        filled: true,
                        fillColor: HexColor.fromHex('#F3F1F1'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 10,
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
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);

                      if (!emailValid) {
                        return "Enter valid email address";
                      }
                      return null;
                    },
                  ),
                ),
                TextButton(
                  style: greenButtonStyle,
                  //################################################Create Account#######################################
                  onPressed: () {
                    if (_formField.currentState!.validate()) {
                      //print(email);
                      //print(emailController.text);
                      if(emailController.text==email && username==nameController.text && fullname==fulNameController.text){
                        // ignore: use_build_context_synchronously
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.topSlide,
                          showCloseIcon: true,
                          title: "No Change",
                          desc:
                          "There is no any Changes",
                          btnCancelOnPress: () {

                          },
                          btnCancelText: "OK",
                          btnCancelColor: HexColor.fromHex('#4CD964'),
                        ).show();
                      }else{
                        updateUser(context);
                      }

                    }
                  },
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),

                /*SizedBox(height: height / 30),

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
                      color: HexColor.fromHex('#4CD964'),
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
