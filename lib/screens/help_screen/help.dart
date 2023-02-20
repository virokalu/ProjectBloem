import 'package:flutter/material.dart';
import '../../components/back_button_icon.dart';
import '../../components/size.dart';

class HelpScreen extends StatefulWidget{
  const HelpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  List<bool> expanded = [false, false];

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
        child: Scaffold(

          body: Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
            child: ListView(
              children: [
                const ButtonText(text: "Help", icon: Icons.help_center),
                SizedBox(height: getProportionateScreenHeight(18),),

                SingleChildScrollView(
                  child:ExpansionPanelList(
                    expansionCallback: (panelIndex, isExpanded) {
                      setState(() {
                        expanded[panelIndex] = !isExpanded;
                      }
                      );
                    },
                    children:[
                      ExpansionPanel(
                          headerBuilder: (context, isOpen){
                            return const Padding(
                                padding: EdgeInsets.all(15),
                                child:Text("Is an email required?")
                            );
                          },
                          body: Container(
                            padding: const EdgeInsets.all(20),
                            child: const Text("Yes, you have to have an email address to sign up"),
                          ),
                          isExpanded: expanded[0]
                      ),

                      ExpansionPanel(
                          headerBuilder: (context, isOpen){
                            return const Padding(
                                padding: EdgeInsets.all(15),
                                child:Text("How can I change my account details?")
                            );
                          },
                          body: Container(
                            padding: const EdgeInsets.all(20),
                            child: const Text("To change the details on your account, log in to your account and go to your account's my profile page."),
                          ),
                          isExpanded: expanded[1]
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );

  }
}