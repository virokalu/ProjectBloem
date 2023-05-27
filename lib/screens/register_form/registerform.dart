import 'dart:async';
import 'dart:convert';
import 'dart:math';
//import 'dart:html';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:project_bloem/components/back_button_icon.dart';
//import 'package:project_bloem/screens/login_screen/login.dart';

import '../../components/button_components.dart';
import 'package:http/http.dart' as http;
import 'package:project_bloem/config.dart';

import '../../components/color_components.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

var _values = [
  "Ampara",
  "Anuradhapura",
  "Badulla",
  "Batticaloa",
  "Colombo",
  "Galle",
  "Gampaha",
  "Hambantota",
  "Jaffna",
  "Kalutara",
  "Kandy",
  "Kegalle",
  "Kilinochchi",
  "Kurunegala",
  "Mannar",
  "Matale",
  "Matara",
  "Monaragala",
  "Mullativu",
  "Nuwara Eliya",
  "Polonnaruwa",
  "Puttalam",
  "Ratnapura",
  "Trincomalee",
  "Vavuniya"
];

class _RegisterPageState extends State<RegisterPage> {

  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final conformPassController = TextEditingController();
  final fulNameController = TextEditingController();
  final districtController = TextEditingController();

  final otpController = TextEditingController();
  final _formField2 = GlobalKey<FormState>();




  String? district;
  bool passToggle = true;

  bool emailSent = false;
  bool wrongOTP = false;
  bool emailVerified = false;
  bool display = false;

  bool noEmail = false;

  Random random = Random();
  String? otpNumber;


  @override
  void initState(){
    super.initState();
    setState(() {
      emailVerified=false;
    });
  }


  void sendOTP(String sendEmail, String otp) async {
    // Create a SMTP server configuration
    final smtpServer = SmtpServer('mail.smtp2go.com',
        username: 'projectBloem',
        password: '51NmMSln01HhBNRq',
        port: 2525, // Use the appropriate port number for your SMTP server
        ssl: false);

    // Create the email message
    final message = Message()
      ..from = const Address(emailSender)
      ..recipients.add(sendEmail)
      ..subject = 'OTP Verification'
      ..html = '''
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      background-color: #F4F4F4;
      font-family: Arial, sans-serif;
    }

    .container {
      width: 400px;
      margin: 0 auto;
      padding: 20px;
      background-color: #FFFFFF;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .green {
      color: #4CD964;
    }

    .otp {
      background-color: #E7E7E7;
      padding: 10px;
      border-radius: 5px;
      margin-top: 20px;
    }

    .otp.green {
      background-color: #E7FFED;
      font-size: 18px;
    }

    .username {
      color: #333333;
      font-weight: bold;
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Email Verification</h1>
    <p>Please use the following OTP to verify your email:</p>
    <div class="otp green">
      <center><p class="green">$otp</p><center>
      
    </div>
    
  </div>
</body>
</html>''';
    //..text = 'Your OTP: $otp for username: $username';

    try {
      await send(message, smtpServer);
      setState(() {
        emailSent=true;
      });
    } catch (e) {
      print('Failed to send OTP: $e');
    }
  }



  Future<void> registerUser(BuildContext context) async{
    final completer = Completer<void>();
    var regBody = {
      "username":nameController.text,
      "fullname":fulNameController.text,
      "email":emailController.text,
      "password":passController.text,
      "district":district,
    };
    //print(registration);
    var response = await http.post(Uri.parse(registration),
        headers: {"Content-Type":"application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode(regBody)
    );
    var jsonResponse = jsonDecode(response.body);
    //print(jsonResponse['status']);
    if(jsonResponse['status']){

      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        //dialogBackgroundColor: Colors.black,
        animType: AnimType.topSlide,

        showCloseIcon: true,
        title: "Success!",
        desc: "Registered Successfully",

        btnOkOnPress: (){
          Navigator.pushNamed(context, '/login');
          //print("Inside Login");
          completer.complete();
        },
        btnOkText: "OK",

        btnOkColor: HexColor.fromHex('#4CD964'),
      ).show();

    }else if(!jsonResponse['status']){
      var myEmail="email";
      var myUser="user";
      if(jsonResponse['exist'].contains(myEmail)){

        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          //dialogBackgroundColor: Colors.black,
          animType: AnimType.topSlide,

          showCloseIcon: true,
          title: "Email Already Exist",
          desc: "${emailController.text} is already in use. Please try another email address or Login",
          btnCancelOnPress: (){
            emailController.clear();
            setState(() {
              emailVerified=false;
              noEmail=false;
              wrongOTP=false;
              display=false;
            });
            completer.complete();

          },
          btnOkOnPress: (){
            Navigator.pushNamed(context, '/login');

            //print("Inside Login");
            completer.complete();
          },

          btnOkText: "Login",
          btnCancelText: "OK",
          btnOkColor: HexColor.fromHex('#4CD964'),
        ).show();
        return completer.future;


        //print(jsonResponse['exist']);

      }else if(jsonResponse['exist'].contains(myUser)){
        // ignore: use_build_context_synchronously
        AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.topSlide,
            showCloseIcon: true,
            title: "Username Already Exist",
            desc: "${nameController.text} is already in use. Please try another username",
            btnCancelOnPress: (){
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
          margin: EdgeInsets.all(width/30),
          child: Form(
            key: _formField,
            child: ListView(
              children: [
          
                const ButtonText(text: "Create Account", icon: Icons.account_circle_outlined),
          
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

                const Padding(
                  padding: EdgeInsets.fromLTRB(23.0,0,23.0,0),
                  child: Text(
                    "Enter the email to create your account and we'll send you an email with OTP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
          
                SizedBox(
                  height: height/12,
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
                TextButton(
                  style:  greenButtonStyle,
                  //############################navigate to registration form##########################################
                  onPressed: () {
                    // Generate a random integer between 0 and 9
                    if(emailController.text.isNotEmpty){
                      int randomNumber = random.nextInt(9000)+1000;
                      otpNumber = randomNumber.toString();
                      sendOTP(emailController.text, otpNumber!);
                      setState(() {
                        emailSent=true;
                        noEmail=false;
                      });

                    }else{
                      setState(() {
                        noEmail=true;
                      });
                    }

                  },
                  child: const Text(
                    "Send OTP",
                    style: TextStyle(
                      color: Colors.white, fontSize: 16.0,
                      fontFamily: 'Poppins',),
                  ),
                ),
                Center(child: noEmail ? const Text(
                  "Enter a Email to Verify",
                  style: TextStyle(
                    color: Colors.red,
                    //fontSize: 20.0,
                  ),
                ) : const Text("")),

                //

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
                        style: emailSent ? greenButtonStyle
                            : greyButtonStyle,
                        //################################################Preview#######################################
                        onPressed: () async {

                          if(emailSent){
                            if(_formField2.currentState!.validate()){
                              //print("success");
                              //emailCheck(context);
                              if(otpNumber==otpController.text){
                                // preference = await SharedPreferences.getInstance();
                                // preference.setString('username', username!);
                                // otpController.clear();
                                // otpNumber=null;
                                //Navigator.pushNamed(context, '/updatepassword');
                                setState(() {
                                  emailVerified=true;
                                  wrongOTP=false;
                                  //noEmail=false;
                                });

                              }else{
                                setState(() {
                                  wrongOTP=true;
                                });
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
                          "Verify Email",
                          style: TextStyle(color:Colors.white, fontSize: 16.0,
                            fontFamily: 'Poppins',),
                        ),
                      ),
                    ),


                  ],

                ),
                Column(
                  children: [
                    const SizedBox(height: 2),
                    Center(child: wrongOTP ? const Text(
                      "Wrong OTP Number!",
                      style: TextStyle(
                        color: Colors.red,
                        //fontSize: 20.0,
                      ),
                    ) : const Text("")),
                  ],
                ) ,
                Column(
                  children: [
                    const SizedBox(height: 2),
                    Center(child: emailVerified ? const Text(
                      "Email Verified!",
                      style: TextStyle(
                        color: Colors.green,
                        //fontSize: 20.0,
                      ),
                    ) : const Text("")),
                  ],
                ) ,
                const SizedBox(height:20,),

                SizedBox(
                  height: height/10,
                  child: DropdownButtonFormField<String>(
                    value: district,
                    onChanged: (String? newValue) {
                      setState(() {
                        district = newValue;
                      });
                    },
                    decoration: InputDecoration(

                      filled: true,
                      //errorText: category == null ? 'This field is required' : null, // Add this line

                      fillColor: HexColor.fromHex('#F3F1F1'),
                      prefixIcon: const Icon(Icons.location_pin),
                      labelText: "District",

                      //labelText: 'Select an item',
                      hintText: 'Choose your district',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    items: _values.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: height/10,
                  child: TextFormField(
                    controller: passController,
                    obscureText: true,
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
                    obscureText: true,
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
                      if(emailVerified){
                        registerUser(context);
                      }else{
                        display=true;
                      }
                      //print("success");

                      //print('Random number: $randomNumber');
                      // showModalBottomSheet(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return Container();
                      //
                      //   },
                      // );


                      //registerUser(context);


                    }


                  },
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Colors.white, fontSize: 16.0,
                      fontFamily: 'Poppins',),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 2),
                    Center(child: wrongOTP ? const Text(
                      "Verify Your Email!",
                      style: TextStyle(
                        color: Colors.red,
                        //fontSize: 20.0,
                      ),
                    ) : const Text("")),
                  ],
                ) ,

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
