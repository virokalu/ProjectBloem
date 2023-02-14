import 'package:flutter/material.dart';
import '../../components/back_button_icon.dart';

class ResetPassword extends StatelessWidget {


  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width/30),
          child: ListView(
            children: [
              const ButtonText(text: 'Reset Password',icon:Icons.lock),
              
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

                ),
              ),//textfield 2

              
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF000000),
                  backgroundColor: const Color(0xFF4cd964),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fixedSize: const Size(327,56),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Reset Password",
                ),
              ),//login button

              SizedBox(height: height / 30,),
              const Text(
                "Enter the email associated with your account and we'll send an email with instructions to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),//text

            ],
          ),
        ),
      ),
    );
  }
}
