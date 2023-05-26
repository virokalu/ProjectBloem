import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';
import '../../components/color_components.dart';
import 'package:http/http.dart' as http;


import '../../config.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  //OTP class Initialization
  //EmailOTP myAuth = EmailOTP();
  bool emailVerified = false;
  Random random = Random();
  String? otpNumber;

  late SharedPreferences preference;
  String? username;

  final _formField = GlobalKey<FormState>();
  final _formField2 = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final otpController = TextEditingController();

  // @override
  // void initState(){
  //   super.initState();
  //   init();
  // }
  // Future init() async{
  //   //String? fullname=preference.getString('fullname');
  //   //String? token=preference.getString('token');
  //   //bool? sellerStates = preference.getBool('sellerStates');
  //   //print(token);
  //
  //   // if(token==null){
  //   //   //print(token);
  //   //   // ignore: use_build_context_synchronously
  //   //   Navigator.pushNamed(context, '/login');
  //   // }
  //   // setState(() =>this.sellerStates=sellerStates!);
  //   //setState(() =>this.fullname=fullname!);
  //
  // }
  void sendOTP(String sendEmail, String otp) async {
    // Create a SMTP server configuration
    final smtpServer = SmtpServer('mail.smtp2go.com',
        username: 'projectBloem',
        password: '51NmMSln01HhBNRq',
        port: 2525, // Use the appropriate port number for your SMTP server
        ssl: false);

    // Create the email message
    final message = Message()
      ..from = const Address('virokemin@gmail.com')
      ..recipients.add(sendEmail)
      ..subject = 'OTP Verification'
      ..text = 'Your OTP: $otp';

    try {
      await send(message, smtpServer);
      setState(() {
        emailVerified=true;
      });
    } catch (e) {
      print('Failed to send OTP: $e');
    }
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

      username = jsonResponse['username'];
      // Generate a random integer between 0 and 9
      int randomNumber = random.nextInt(9000)+1000;
      //print('Random number: $randomNumber');

      otpNumber = randomNumber.toString();

      //SendOTP
      sendOTP(emailController.text, otpNumber!);

       // bool? Check = await myAuth.sendOTP();
       // print(Check);
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
          child:  ListView(
              children: [
                const ButtonText(text: 'Forget Password',icon:Icons.lock),

                SizedBox(height: height / 30,),
          Form(
            key: _formField,
            child:
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
                    Form(
                      key: _formField2,
                      child: SizedBox(
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
                          validator: (value){
                            if(value!.isEmpty){
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: width/100,),
                    SizedBox(
                      width: width/2.3,
                      child: TextButton(
                        style: emailVerified ? greenButtonStyle
                        : greyButtonStyle,
                        //################################################Preview#######################################
                        onPressed: () async {

                          if(emailVerified){
                            if(_formField2.currentState!.validate()){
                              //print("success");
                              //emailCheck(context);
                              if(otpNumber==otpController.text){
                                // preference = await SharedPreferences.getInstance();
                                // preference.setString('username', username!);
                                // otpController.clear();
                                // otpNumber=null;
                                Navigator.pushNamed(context, '/updatepassword');

                              }
                            }
                          }
                          //verify();

                          // var inputOTP = otpController.text; //which is entered by client, after receive mail
                          // await myAuth.verifyOTP(
                          //     otp: inputOTP
                          // );
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
      );
  }
}



