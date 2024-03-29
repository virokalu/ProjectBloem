import 'package:flutter/material.dart';

import '../../components/button_components.dart';
import '../../components/color_components.dart';

class ItemView extends StatefulWidget {
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context, 
                builder: (context) => bottomesheet(),
                backgroundColor: Colors.white,
              );
            }, 
            child: const Text("press"),
          ),
      ),
    );
  }

  Widget bottomesheet() {
    return SizedBox(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width/30),
        child: ListView(
          children: [Column(
            children: [
              const Text("Card Holder name"),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Manoj Lakshan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Card Number"),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "1234 5678 9012",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Date"),
                        const SizedBox(height: 20,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "04/03",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                          keyboardType: const TextInputType.numberWithOptions(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 80),
                  Expanded(
                    child: Column(
                      children: [
                        const Text("CCV"),
                        const SizedBox(height: 20,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "123",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                          style: greenButtonStyle,
                          onPressed: () {},
                          child: const Text(
                                "Cash on Delivery",
                                style: TextStyle(color: Colors.white, fontSize: 16.0,
                                fontFamily: 'Poppins',),
                          ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextButton(
                          style: greenButtonBorderStyle,
                          onPressed: () {},
                          child: Text(
                              "Complete Order",
                              style: TextStyle(
                                  color: HexColor.fromHex('#4CD964'), fontSize: 16.0,
                                  fontFamily: 'Poppins',),
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}

