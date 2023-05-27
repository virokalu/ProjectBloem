import 'dart:async';
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project_bloem/components/button_components.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/back_button_icon.dart';
import 'package:http/http.dart' as http;

import '../../../components/color_components.dart';
import '../../../config.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {

  late SharedPreferences preference;
  String? username;

  bool _isObscureConfirm=true;
  bool _isObscure=true;



  @override
  void initState(){
    super.initState();
    //init();
  }
  // Future init() async{
  //   preference = await SharedPreferences.getInstance();
  //   String? username = preference.getString('username');
  //   setState(() =>this.username=username!);
  // }

  final _formField = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  Future<void> updatePassword(BuildContext context) async {
    final completer = Completer<void>();
    var passwordBody = {
      "username": username,
      "newpassword": newPasswordController.text,
    };
    var response = await http.post(Uri.parse(resetpassword),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(passwordBody)
    );
    var jsonResponse = jsonDecode(response.body);

    if(jsonResponse['status']){
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        //dialogBackgroundColor: Colors.black,
        animType: AnimType.topSlide,

        showCloseIcon: true,
        title: "Password Changed",
        desc: "Password Changed Successfully!",

        btnOkOnPress: (){
          Navigator.pushNamed(context, '/login');

        },
        btnOkText: "OK",
        btnOkColor: HexColor.fromHex('#4CD964'),
      ).show();
      return completer.future;
    }else{
      print("Password Didn't Changed");
    }
    // else if(!jsonResponse['status']){
    //   // ignore: use_build_context_synchronously
    //   AwesomeDialog(
    //     context: context,
    //     dialogType: DialogType.warning,
    //     //dialogBackgroundColor: Colors.black,
    //     animType: AnimType.topSlide,
    //
    //     showCloseIcon: true,
    //     title: "Incorrect Password",
    //     desc: "Please Try Again!",
    //
    //     btnOkOnPress: (){
    //
    //     },
    //     btnOkText: "OK",
    //     btnOkColor: HexColor.fromHex('#4CD964'),
    //   ).show();
    //   return completer.future;
    // }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formField,

        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: width / 10,
            horizontal: height / 90,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ButtonText(text: 'Change Password', icon: Icons.password),
                const SizedBox(height: 20),
                /*const Divider(
                  height: 0.1,
                  thickness: 10.0,
                ),*/
                const SizedBox(height: 20),
                // TextFormField(
                //   decoration: InputDecoration(
                //     prefixIcon: const Icon(Icons.lock),
                //     hintText: 'Current Password',
                //     filled: true,
                //     fillColor: Colors.white38,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     suffixIcon: IconButton(
                //       icon: Icon(
                //         // Based on passwordVisible state choose the icon
                //         _isObscureOld
                //             ? Icons.visibility
                //             : Icons.visibility_off,
                //         color: Colors.black,
                //       ),
                //       onPressed: () {
                //
                //         setState(() {
                //           _isObscureOld=!_isObscureOld;
                //         });
                //       },
                //     ),
                //
                //   ),
                //   controller: oldPasswordController,
                //   obscureText: _isObscureOld,
                //
                //   validator: (value){
                //     if(value!.isEmpty){
                //       return "";
                //     }
                //     return null;
                //   },
                //
                // ),
                const SizedBox(height: 20),
                const Text(
                  'Please enter your new password below',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.grey
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'New Password',
                    filled: true,
                    fillColor: Colors.white38,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _isObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {

                        setState(() {
                          _isObscure=!_isObscure;
                        });
                      },
                    ),
                  ),
                  controller: newPasswordController,
                  obscureText: _isObscure,
                  validator: (value){
                    if(value!.isEmpty){
                      return "";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Confirm Password',
                    filled: true,

                    fillColor: Colors.white38,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _isObscureConfirm
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {

                        setState(() {
                          _isObscureConfirm=!_isObscureConfirm;
                        });
                      },
                    ),
                  ),
                  controller: confirmNewPasswordController,
                  obscureText: _isObscureConfirm,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Re-Enter Your Password";
                    }
                    else if(newPasswordController.text != confirmNewPasswordController.text){
                      newPasswordController.clear();
                      confirmNewPasswordController.clear();
                      return "Password not confirmed!";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: width,
                  child: TextButton(
                    style: greenButtonStyle,
                    onPressed: () {
                      if(_formField.currentState!.validate()){
                        //print("success");
                        updatePassword(context);
                      }
                    },
                    child: const Text(
                      'Change Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void didChangeDependencies() {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    username = arguments['username'];
    //_fetchNews();
    super.didChangeDependencies();
  }
}
