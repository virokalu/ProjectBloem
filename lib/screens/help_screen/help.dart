import 'package:flutter/material.dart';
import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';
import '../../components/color_components.dart';
import '../../components/size.dart';

class HelpScreen extends StatefulWidget{
  const HelpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  List<bool> expanded = [false, false, false, false, false];
  final queController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
            child: ListView(
              children: [
                const ButtonText(text: "Help", icon: Icons.help_center),
                SizedBox(height: getProportionateScreenHeight(20),),

                const Text(
                  "FAQ's",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 28,
                    //color: HexColor.fromHex('#4CD964'),
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                const Image(image: AssetImage('images/questions.jpg')),
                SizedBox(height: getProportionateScreenWidth(20)),

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
                            return  Padding(
                                padding: EdgeInsets.all(15),
                                child:
                                  Text(
                                      "How to sign in for BLOEM?",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        color: HexColor.fromHex('#4CD964'),
                                     ),
                                  ),
                            );
                          },
                          body: Container(
                            padding: const EdgeInsets.all(5),
                            child:
                              const Text(
                                  "You must have an email address to sign in. You can only have one account per email address and add a unique username to identify ypu. Also you have to have an unique username to sign in. No need of creating two accounts as a buyer and a seller. You just need only one account and it will allow you to act as a buyer and a seller.",
                                  style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                ),
                              ),
                          ),
                          isExpanded: expanded[0]
                      ),

                      ExpansionPanel(
                          headerBuilder: (context, isOpen){
                            return  Padding(
                                padding: EdgeInsets.all(15),
                                child:
                                  Text(
                                      "How can I change my account details?",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        color: HexColor.fromHex('#4CD964'),
                                    ),
                                  )
                            );
                          },
                          body: Container(
                            padding: const EdgeInsets.all(5),
                            child:
                            const Text(
                              "To change the details on your account, first of all log in to your account and go to your account's my profile page. Then you can edit your details as your wish.",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 15,
                              ),
                            ),
                          ),
                          isExpanded: expanded[1]
                      ),

                      ExpansionPanel(
                          headerBuilder: (context, isOpen){
                            return  Padding(

                              padding: EdgeInsets.all(15),
                              child:
                              Text(
                                "How can I buy a product?",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  color: HexColor.fromHex('#4CD964'),
                                ),
                              ),
                            );
                          },
                          body: Container(
                            padding: const EdgeInsets.all(5),
                            child:
                            const Text(
                              "You can search the products by using search option or just clicking on the relevant category. Then you can view the product details and click Buy Now to purchase it or add to your basket.",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 15,
                              ),
                            ),
                          ),
                          isExpanded: expanded[2]
                      ),

                      ExpansionPanel(
                          headerBuilder: (context, isOpen){
                            return  Padding(
                              padding: EdgeInsets.all(15),
                              child:
                              Text(
                                "Can I save a product to purchase in future?",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  color: HexColor.fromHex('#4CD964'),
                                ),
                              ),
                            );
                          },
                          body: Container(
                            padding: const EdgeInsets.all(5),
                            child:
                            const Text(
                              "Yes, you can add any product to the wishlist and it will save the selected products until you come back. You can edit the wishlist if you are not interested. ",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 15,
                              ),
                            ),
                          ),
                          isExpanded: expanded[3]
                      ),

                      ExpansionPanel(
                          headerBuilder: (context, isOpen){
                            return  Padding(
                              padding: EdgeInsets.all(15),
                              child:
                              Text(
                                "How can I add a product to sell?",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  color: HexColor.fromHex('#4CD964'),
                                ),
                              ),
                            );
                          },
                          body: Container(
                            padding: const EdgeInsets.all(5),
                            child:
                            const Text(
                              "Log in to your account and then go to your profile. Select Add Listing option. Fill the fields using relevant details and you can add three images to the application. Please be careful when you adding the Common Name since it will be the keyword to searching option.",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 15,
                              ),
                            ),
                          ),
                          isExpanded: expanded[4]
                      ),
                    ],
                  ),

                ),

                SizedBox(height: getProportionateScreenWidth(20)),

                TextButton(
                  style: greenButtonStyle,
                    child:  Text(
                        "Any other question?",
                        style: TextStyle(
                          color: HexColor.fromHex('#ffffff'),
                          fontFamily: "Poppins",
                          fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            var queController;
                            return Container(
                              height: 250,
                                padding: EdgeInsets.all(15),

                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: queController,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.person),
                                        labelText: "Add your question here",
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

                                  SizedBox(height: getProportionateScreenWidth(20)),

                                  TextButton(
                                    style: greenButtonStyle,
                                      child:  Text(
                                          "Submit",
                                          style: TextStyle(
                                            color: HexColor.fromHex('#ffffff'),
                                            fontFamily: "Poppins",
                                            fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                  )
                                ],
                              )
                            );



                          }
                      );
                    },
                )
              ],
            ),
          ),
        )
    );

  }
}