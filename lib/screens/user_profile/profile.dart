import "package:flutter/material.dart";
import 'package:project_bloem/screens/user_profile/user_details.dart';
import '../../components/back_button_icon.dart';
import 'iconwith_text.dart';

class UserProfile extends StatelessWidget {
  var size,width,height;

  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;

    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(width/30),
            child: ListView(
              children: [
                const ButtonText(text: " My Profile", icon: Icons.person_outline),
                SizedBox(height: height/20),
                userdetail(name: "       manoj lakshan vijayathunga", image: "images/background1.jpg"),
                const SizedBox(height: 20,),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.monitor_heart_rounded, text: "Wish List", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.chat, text: "Chat", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.sell, text: "Shell", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.settings, text: "Setting", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.help, text: "Help", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.error, text: "About Us", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.logout, text: "Logout", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              ],
            ),
          ),
        ),
    );
  }
}