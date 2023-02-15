import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';
import 'package:project_bloem/components/product_cards.dart';

class SellingPage extends StatelessWidget {
  const SellingPage({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(width / 30),
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
             children: [
               const ButtonText(text: "Sell", icon: Icons.list),
                //const SizedBox(height: 15,),
               const Text("To Deliver",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
               ),
               const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                width: 200,
                color: Colors.purple[600],
                child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),
              Container(
                width: 200,
                color: Colors.purple[500],
                child: const Center(child: Text('Item 2', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),
              Container(
                width: 200,
                color: Colors.purple[400],
                child: const Center(child: Text('Item 3', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),
              Container(
                width: 200,
                color: Colors.purple[300],
                child: const Center(child: Text('Item 4', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),
                  ],
                ),
              ),
             ],
          ),
        ),
      ),
    );
  }
}