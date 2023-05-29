import 'package:flutter/material.dart';
//import 'package:project_bloem/screens/setting_screen/account_info/info.dart';
//import 'package:project_bloem/screens/setting_screen/address_book/address.dart';
//import 'package:project_bloem/screens/setting_screen/policies/policy.dart';
import 'package:project_bloem/screens/user_profile/iconwith_text.dart';
//import 'package:project_bloem/screens/setting_screen/password_info/password.dart';

import '../../components/back_button_icon.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: width / 10, horizontal: height / 90),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ButtonText(text: "Settings", icon: Icons.settings),
              const SizedBox(height: 20),
              const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              ClickableBar(
                icon: Icons.account_circle_outlined,
                name: 'Update Profile',
                onPressed: () {
                  Navigator.pushNamed(context, '/changeinfo');
                },
              ),
              const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              ClickableBar(
                icon: Icons.password,
                name: 'Change Password',
                onPressed: () {
                  Navigator.pushNamed(context, '/password');
                },
              ),
              const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              // ClickableBar(
              //   icon: Icons.policy,
              //   name: 'Policies',
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/policy');
              //   },
              // ),
              // const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              /*ClickableBar(
                icon: Icons.help,
                name: 'Help',
                onPressed: () {},
              ),
              ClickableBar(
                icon: Icons.logout,
                name: 'Log Out',
                onPressed: () {},
              ),*/
              //Image.asset(name)
            ],
          ),
        ),
      ),
    );
  }
}
