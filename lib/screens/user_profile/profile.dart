import "package:flutter/material.dart";
import 'package:project_bloem/screens/selling/selling_page.dart';
import 'package:project_bloem/screens/user_profile/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/back_button_icon.dart';
import 'iconwith_text.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  late SharedPreferences preference;
  late bool? sellerStates;


  @override
  void initState(){
    super.initState();
    init();
  }
  Future init() async{
    preference = await SharedPreferences.getInstance();
    //String? fullname=preference.getString('fullname');
    String? token=preference.getString('token');
    sellerStates = preference.getBool('sellerStates');
    //print(token);

    if(token==null){
      //print(token);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/login');
    }
    setState(() =>this.sellerStates=sellerStates!);
    //setState(() =>this.fullname=fullname!);

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    // if(sellerStates == true){
    //   print("ok");
    // }
    // else{
    //   print("not ok");
    // }
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width/30),
          child: ListView(

            children:  [
              const ButtonText(text: "My Profile", icon: Icons.person_outline),
              const SizedBox(height: 30,),
              const ProfileCard(),
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
                name: 'Chat',
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
                  sellerStates == true ? Navigator.pushNamed(context, '/selling') : Navigator.pushNamed(context, '/sellerreg');
                  //Navigator.pushNamed(context, '/selling');
                  // Do something when the bar is clicked
                },
              ),
              //IconWithText(icon: Icons.sell, text: "Shell", address: "address"),
              const Divider(color: Color.fromARGB(255, 243, 236, 236)),

              ClickableBar(
                icon: Icons.settings,
                name: 'Settings',
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

                  Navigator.pushNamed(context, '/aboutus');
                  // Do something when the bar is clicked
                },
              ),
              //IconWithText(icon: Icons.error, text: "About Us", address: "address"),
              const Divider(color: Color.fromARGB(255, 243, 236, 236)),

              ClickableBar(
                icon: Icons.logout,
                name: 'Logout',
                onPressed: () {
                  preference.remove('token');
                  preference.remove('imgPath');
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
