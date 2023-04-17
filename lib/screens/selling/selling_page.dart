import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';
import 'package:project_bloem/components/product_cards.dart';
import 'package:project_bloem/screens/user_profile/iconwith_text.dart';

import '../../components/size.dart';

class SellingPage extends StatelessWidget {
  const SellingPage({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(width / 30),
          child: ListView(
            children: [
              const ButtonText(text: "Sell", icon: Icons.list),
              const Text(
                "To Delivery",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SellingCard(),
                        const SellingCard(),
                        const SellingCard(),
                        const SellingCard(),
                        
                        SizedBox(width: getProportionateScreenWidth(20)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Active",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "edit",
                            style: TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          Icon(Icons.edit),
                        ],
                      ),
                    ],
                  ),

                  const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SellingCard(),
                        const SellingCard(),
                        const SellingCard(),
                        const SellingCard(),

                        SizedBox(width: getProportionateScreenWidth(20)),
                      ],
                    ),
                  ),
                  //SizedBox(height: 10,),
                  Column(
                    
                    children: [
                      const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     //Icon(Icons.add),
                      //     IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                      //     const Text(
                      //       "Create Listing",
                      //       style: TextStyle(
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      ClickableBar(
                        icon: Icons.add,
                        name: 'Create Listing',
                        onPressed: () {
                          Navigator.pushNamed(context, '/addListing');
                        },
                      ),
                      //IconWithText(icon: Icons.chat, text: "Chat", address: "address"),

                      const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     IconButton(onPressed: (){}, icon: const Icon(Icons.summarize_outlined)),
                      //     const Text(
                      //       "Summary",
                      //       style: TextStyle(
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      ClickableBar(
                        icon: Icons.summarize_outlined,
                        name: 'Summary',
                        onPressed: () {
                          Navigator.pushNamed(context, '/summery');
                        },
                      ),
                      const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     IconButton(onPressed: (){}, icon: const Icon(Icons.delivery_dining_sharp)),
                      //     const Text(
                      //       "Delivery",
                      //       style: TextStyle(
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      ClickableBar(
                        icon: Icons.delivery_dining_sharp,
                        name: 'Delivery',
                        onPressed: () {
                          Navigator.pushNamed(context, '/delivery');
                        },
                      ),

                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}