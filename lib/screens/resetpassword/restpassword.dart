import 'dart:async';
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';
import '../../components/color_components.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = EmailAuth(
      sessionName: "Sample session",

    );
    /// Configuring the remote server
    //emailAuth.config("server": 'your-gmail-email', "serverKey": 'your-gmail-password');
  }

  Future<void> emailCheck(BuildContext context) async {
    final completer = Completer<void>();
    var emailBody = {
      "email": emailController.text,
    };
    var response = await http.post(Uri.parse(email),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(emailBody)
    );
    var jsonResponse = jsonDecode(response.body);

    if(jsonResponse['status']){

      //sendOtp();#####################################################################################################################################################

    }else{
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        //dialogBackgroundColor: Colors.black,
        animType: AnimType.topSlide,

        showCloseIcon: true,
        title: "Incorrect Email",
        desc: "Please Check your email & Try Again!",

        btnOkOnPress: (){
          emailController.clear();
          },
        btnOkText: "OK",
        btnOkColor: HexColor.fromHex('#4CD964'),
      ).show();
      return completer.future;
    }
  }
  // void verify() {
  //   var result=emailAuth.validateOtp(
  //       recipientMail: emailController.value.text,
  //   userOtp: otpController.value.text);
  //   if(result){
  //     print("email verified");
  //   }
  // }
  //
  // void sendOtp() async {
  //   bool result = await emailAuth.sendOtp(
  //       recipientMail: emailController.value.text, otpLength: 5
  //   );
  //   if(result){
  //
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width/30),
          child: Form(
            key: _formField,
            child: ListView(
              children: [
                const ButtonText(text: 'Forget Password',icon:Icons.lock),

                SizedBox(height: height / 30,),
                SizedBox(
                  height: height/10,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail_outlined),
                        labelText: "Email",
                        filled: true,
                        fillColor: Colors.white38,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                    controller: emailController,
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
                ),//textfield 2


                TextButton(
                  style: greenButtonBorderStyle,
                  onPressed: () {
                    if(_formField.currentState!.validate()){
                      //print("success");
                      emailCheck(context);

                    }
                  },
                  child: Text(
                    "Send OTP",
                    style: TextStyle(color: HexColor.fromHex('#4CD964'), fontSize: 16.0,
                      fontFamily: 'Poppins',),
                  ),
                ),//login button

                SizedBox(height: height / 25,),
                const Padding(
                  padding: EdgeInsets.fromLTRB(23.0,0,23.0,0),
                  child: Text(
                    "Enter the email associated with your account and we'll send you an email with OTP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),//text
                SizedBox(height: height / 25,),


                Row(
                  children: [
                    SizedBox(
                      width: width/2.1,
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.key),
                            labelText: "Enter OTP",
                            filled: true,
                            fillColor: Colors.white38,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        controller: otpController,


                      ),
                    ),
                    SizedBox(width: width/100,),
                    SizedBox(
                      width: width/2.3,
                      child: TextButton(
                        style: greenButtonStyle,
                        //################################################Preview#######################################
                        onPressed: () {
                          //verify();

                        },
                        child: const Text(
                          "Password Reset",
                          style: TextStyle(color:Colors.white, fontSize: 16.0,
                            fontFamily: 'Poppins',),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}



