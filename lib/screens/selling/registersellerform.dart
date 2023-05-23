import "dart:convert";
import 'package:http/http.dart' as http;
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:project_bloem/config.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:url_launcher/url_launcher.dart";

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
  final publicKeyController = TextEditingController();
  final stripeIdController = TextEditingController();
  bool passToggle = true;

  late SharedPreferences preference;
  
  String? username;
  
  
  @override
  void initState(){
    super.initState();
    init();
  }
  Future init() async{
    preference = await SharedPreferences.getInstance();
    String? username=preference.getString('username');
    setState(() =>this.username=username!);

  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    Future<void> updateSeller(String username,bool sellerStates) async {
        final Map<String,dynamic> requestBody = {
          "upsellerStates" : sellerStates,
        };


        final String encodeBody = jsonEncode(requestBody);
        print(encodeBody);

        final response = await http.put(
            // ignore: prefer_interpolation_to_compose_strings
            Uri.parse(upSellerStates+"/"+username),
            headers: {
                'Content-Type': 'application/json',
            },

        body: encodeBody,
        );

        preference.setBool("sellerStates", true);
    }

    Future<void> registerAccDetails() async {

      final Map<String , dynamic> reqBody = {
          "username" : username,
          "publishable_key" : publicKeyController.text,
          "stripe_id" : stripeIdController.text,
      };

      final response = await http.post(
        Uri.parse(regseller),
          headers: {
              'Content-Type': 'application/json',
          },
          body: jsonEncode(reqBody),
      );

      if(response.statusCode == 201) {
          print("success");
      }

    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width/30),
          child: Form(
            key: _formField,
            child: ListView(
              children: [
          
                const ButtonText(text: "Register Seller", icon: Icons.account_circle_outlined),
          
                SizedBox(height: height/30),

                const Text(
                  "Enter your Stripe account details ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: height/30,),
                SizedBox(
                  height: height/10,
                  child: TextFormField(
                    controller: publicKeyController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        labelText: "Publishable Key",
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
                    controller: stripeIdController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_pin_sharp),
                        labelText: "Stripe Id",
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

                SizedBox(height: height/10,),

                const Text(
                  "Your didn't have a Stripe account ! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: height/30,),

                RichText(
                  text: TextSpan(
                      text: 'Click here to Create Stripe account',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                      ..onTap = () {
                          _launchURL('https://dashboard.stripe.com/register');
                      },
                    ),
                    textAlign : TextAlign.center,
                ),

                SizedBox(height: height/30,),

                const Text(
                  "Now enter your publishble key and stripe id and register by click register button",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: height/30,),
                TextButton(
                  style: greenButtonStyle,
                  //################################################Create Account#######################################
                  onPressed: () {
                    if(_formField.currentState!.validate()){
                      print("success");
                      setState(() {

                        registerAccDetails();
                        updateSeller(username!,true);
                        Navigator.pushNamed(context, '/selling');

                      });
                      //registerUser(context);


                    }


                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 16.0,
                      fontFamily: 'Poppins',),
                  ),
                ),

                SizedBox(height: height / 30),

                
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}