import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';
import 'package:project_bloem/components/button_components.dart';
import 'package:project_bloem/components/color_components.dart';
import 'package:project_bloem/screens/item_view/image_dialog.dart';
import 'package:project_bloem/screens/item_view/item_view_component.dart';

class ItemViewNew extends StatefulWidget {
  const ItemViewNew({super.key});

  @override
  State<ItemViewNew> createState() => _ItemViewNewState();
}

class _ItemViewNewState extends State<ItemViewNew> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.all(width / 30),
        child: Column(children: [
          ItemViewComponents(text: 'Title Here'),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => const ImageDialog('images/112.jpg'));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/112.jpg')),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      const ImageDialog('images/112.jpg'));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('images/112.jpg')),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      const ImageDialog('images/112.jpg'));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('images/112.jpg')),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(width / 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      "Each 2.5-Inch Pot contains 1 plant Plant needs : Light Level:Full Sun(6 + hours of direct sunlight) Soil Moisture: Moist,Dry Fertilizer:when transplanted and then every 3-4 weeks"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Rs.500.00",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Expanded(
                    child: TextButton(
                      style: greenButtonStyle,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => bottomesheet(),
                          backgroundColor: Colors.white,
                        );
                      },
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Poppings',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: TextButton(
                    style: greenButtonBorderStyle,
                    onPressed: () {},
                    child: Text(
                      "Add Basket",
                      style: TextStyle(
                        color: HexColor.fromHex('#4CD964'),
                        fontSize: 16.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )),
                  const SizedBox(height: 10),
                  Expanded(
                      child: TextButton(
                    style: greenButtonBorderStyle,
                    onPressed: () {},
                    child: Text(
                      "Chat",
                      style: TextStyle(
                        color: HexColor.fromHex('#4CD964'),
                        fontSize: 16.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }

//button click action for buy now button
  Widget bottomesheet() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
        child: ListView(
          children: [
            Column(
              children: [
                const Text("Card Holder name"),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Manoj Lakshan",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Card Number"),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "1234 5678 9012",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text("Date"),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "04/03",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 80),
                    Expanded(
                      child: Column(
                        children: [
                          const Text("CCV"),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "123",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: greenButtonStyle,
                        onPressed: () {},
                        child: const Text(
                          "Cash on Delivery",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                          ),
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
                            color: HexColor.fromHex('#4CD964'),
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                          ),
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
