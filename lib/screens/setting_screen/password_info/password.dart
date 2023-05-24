import 'package:flutter/material.dart';
import 'package:project_bloem/components/button_components.dart';

import '../../../components/back_button_icon.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
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
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Current Password',
                  filled: true,
                  fillColor: Colors.white38,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please enter your new password below',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'New Password',
                  filled: true,
                  fillColor: Colors.white38,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.white38,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: width,
                child: TextButton(
                  style: greenButtonStyle,
                  onPressed: () {},
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
    );
  }
}
