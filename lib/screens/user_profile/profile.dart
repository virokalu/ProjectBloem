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

              children:  [
                const ButtonText(text: "My Profile", icon: Icons.person_outline),
                const SizedBox(height: 30,),
                const ProfileCard(username: "manoj lakshan vijayathunga",fullName: "images/background1.jpggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg"),
                const SizedBox(height: 10,),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),

                ClickableBar(
                  icon: Icons.favorite_border,
                  name: 'WishList',
                  onPressed: () {
                    Navigator.pushNamed(context, '/mybusket');
                  },
                ),

                //IconWithText(icon: Icons.monitor_heart_rounded, text: "Wish List", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),

                ClickableBar(
                  icon: Icons.chat,
                  name: 'chat',
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                ),
                //IconWithText(icon: Icons.chat, text: "Chat", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),

                ClickableBar(
                  icon: Icons.sell ,
                  name: 'Sell',
                  onPressed: () {
                    Navigator.pushNamed(context, '/selling');
                    // Do something when the bar is clicked
                  },
                ),
                //IconWithText(icon: Icons.sell, text: "Shell", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),

                ClickableBar(
                  icon: Icons.settings,
                  name: 'Setting',
                  onPressed: () {

                    Navigator.pushNamed(context, '/setting');
                    // Do something when the bar is clicked
                  },
                ),
                //IconWithText(icon: Icons.settings, text: "Setting", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),

                ClickableBar(
                  icon: Icons.help,
                  name: 'Help',
                  onPressed: () {

                    Navigator.pushNamed(context, '/help');
                    // Do something when the bar is clicked
                  },
                ),
                //IconWithText(icon: Icons.help, text: "Help", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),

                ClickableBar(
                  icon: Icons.error,
                  name: 'About Us',
                  onPressed: () {

                    Navigator.pushNamed(context, '/about us');
                    // Do something when the bar is clicked
                  },
                ),
                //IconWithText(icon: Icons.error, text: "About Us", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),

                ClickableBar(
                  icon: Icons.logout,
                  name: 'Logout',
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                //IconWithText(icon: Icons.logout, text: "Logout", address: "address"),
                const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              ],
            ),
          ),
        ),
    );
  }
}