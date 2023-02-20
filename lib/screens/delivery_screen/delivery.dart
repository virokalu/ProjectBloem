// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../components/back_button_icon.dart';
import '../../components/size.dart';

class DeliveryScreen extends StatefulWidget{
  const DeliveryScreen({super.key});

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen>{

  List<bool> expanded = [false, false];

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(width/30),
            //padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),

            child: ListView(
              children: [
                const ButtonText(text: "Delivery", icon: Icons.delivery_dining),

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
                              padding: EdgeInsets.all(5),
                              child: Text("Pronto"),
                            );
                          },
                          body: Container(
                              padding: const EdgeInsets.all(5),
                              child: const Text("Pronto Lanka (Pvt) Ltd.\n https://www.prontolanka.lk/\n(+94) 112 102 700\ninfopronto@transnational-grp.com")
                          ),
                          isExpanded: expanded[0]
                      ),

                      ExpansionPanel(
                          headerBuilder: (context, isOpen){
                            return const Padding(
                              padding: EdgeInsets.all(5),
                              child: Text("Domex"),
                            );
                          },
                          body: Container(
                              padding: const EdgeInsets.all(5),
                              child: const Text("Domestic Express (Pvt) Ltd.\nhttps://www.domex.lk/\n (+94) 011 7 759 759\n info@domex.lk")
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