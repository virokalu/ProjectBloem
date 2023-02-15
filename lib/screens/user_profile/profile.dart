import "package:flutter/material.dart";
import 'package:project_bloem/screens/user_profile/user_details.dart';
import '../../components/back_button_icon.dart';
import 'iconwith_text.dart';

class UserProfile extends StatelessWidget {


  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(width/30),
            child: ListView(

              children: const [
                ButtonText(text: " My Profile", icon: Icons.person_outline),
                SizedBox(height: 30,),
                UserDetail(name: "       manoj lakshan vijayathunga", image: "images/background1.jpg"),
                SizedBox(height: 20,),
                Divider(color: Color.fromARGB(255, 243, 236, 236)),

                IconWithText(icon: Icons.monitor_heart_rounded, text: "Wish List", address: "address"),
                Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.chat, text: "Chat", address: "address"),
                Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.sell, text: "Shell", address: "address"),
                Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.settings, text: "Setting", address: "address"),
                Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.help, text: "Help", address: "address"),
                Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.error, text: "About Us", address: "address"),
                Divider(color: Color.fromARGB(255, 243, 236, 236)),
                IconWithText(icon: Icons.logout, text: "Logout", address: "address"),
                Divider(color: Color.fromARGB(255, 243, 236, 236)),
              ],
            ),
          ),
        ),
    );
  }
}