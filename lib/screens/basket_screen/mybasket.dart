import 'package:flutter/material.dart';
import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';

class MyBasketScreen extends StatefulWidget {
  const MyBasketScreen({Key? key}) : super(key: key);

  @override
  State<MyBasketScreen> createState() => _MyBasketScreenState();
}

class _MyBasketScreenState extends State<MyBasketScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double priceOne = 1000;
    double priceTwo = 1000;
    double priceThree = 1000;
    double priceFour = 1000;
    double priceFive = 1000;
    double priceSix = 1000;
    double priceSeven = 1000;

    double total = priceOne +
        priceTwo +
        priceThree +
        priceFour +
        priceFive +
        priceSix +
        priceSix +
        priceSeven;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: width / 90, horizontal: height / 90),
              child: Column(
                children: [
                  const ButtonText(
                      text: "My Basket", icon: Icons.shopping_cart),
                  SizedBox(
                    height: height * 0.38,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height / 10,
                                  width: width / 7,
                                  child: const Image(
                                    image: AssetImage('images/112.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: height / 7,
                                  child: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Name Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Quantity Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Rs.$priceOne",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.remove_circle_outline_sharp),
                                  onPressed: () {
                                    //total = total - priceOne;
                                  },
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            height: 0.1,
                          ),
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height / 7,
                                  width: width / 7,
                                  child: const Image(
                                    image: AssetImage('images/112.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: height / 7,
                                  child: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Name Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Quantity Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Rs.$priceTwo",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.remove_circle_outline_sharp),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            height: 0.1,
                          ),
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height / 7,
                                  width: width / 7,
                                  child: const Image(
                                    image: AssetImage('images/112.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: height / 7,
                                  child: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Name Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Quantity Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Rs.$priceThree",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.remove_circle_outline_sharp),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            height: 0.1,
                          ),
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height / 7,
                                  width: width / 7,
                                  child: const Image(
                                    image: AssetImage('images/112.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: height / 7,
                                  child: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Name Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Quantity Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Rs.$priceFour",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.remove_circle_outline_sharp),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            height: 0.1,
                          ),
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height / 7,
                                  width: width / 7,
                                  child: const Image(
                                    image: AssetImage('images/112.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: height / 7,
                                  child: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Name Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Quantity Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Rs.$priceFive",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.remove_circle_outline_sharp),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            height: 0.1,
                          ),
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height / 7,
                                  width: width / 7,
                                  child: const Image(
                                    image: AssetImage('images/112.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: height / 7,
                                  child: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Name Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Quantity Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Rs.$priceSix",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.remove_circle_outline_sharp),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            height: 0.1,
                          ),
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height / 7,
                                  width: width / 7,
                                  child: const Image(
                                    image: AssetImage('images/112.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: height / 7,
                                  child: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Name Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Quantity Here",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Rs.$priceSeven",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.remove_circle_outline_sharp),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            height: 0.1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.25,
                    /*decoration: const BoxDecoration(
                      image: AssetImage(""),
                      fit: BoxFit.cover,
                    ),*/
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: height * 0.2,
                          width: width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                              Text(
                                "Rs.$total",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.4,
                          child: TextButton(
                            style: greenButtonStyle,
                            onPressed: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return Scaffold(
                                    body: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10.0, 0, 10.0, 0),
                                          height: height * 0.5,
                                          width: width,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 20.0,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Card Holder's Name",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: "Manoj ABC",
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white38,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 25.0,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Card Number",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          hintText:
                                                              'xxxx xxxx xxxx xxxx',
                                                          fillColor:
                                                              Colors.white38,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 25.0,
                                              ),
                                              Row(
                                                //crossAxisAlignment:CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.3,
                                                    child: Column(children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                "Date",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15.0,
                                                              ),
                                                              TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      "10/30",
                                                                  filled: true,
                                                                  fillColor: Colors
                                                                      .white38,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.3,
                                                    child: Column(children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                "CCV",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15.0,
                                                              ),
                                                              TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      "548",
                                                                  filled: true,
                                                                  fillColor: Colors
                                                                      .white38,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 25.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    //height: height * 0.1,
                                                    width: width * 0.4,
                                                    child: TextButton(
                                                      style: greenButtonStyle,
                                                      onPressed: () {},
                                                      child: const Text(
                                                        "Cash on Delivery",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18.0),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    //height: height * 0.1,
                                                    width: width * 0.4,
                                                    child: TextButton(
                                                      style:
                                                          greenButtonBorderStyle,
                                                      //style: ButtonStyle(),
                                                      onPressed: () {},
                                                      child: const Text(
                                                        "Complete Order",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 18.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    floatingActionButton: Container(
                                      transform: Matrix4.translationValues(
                                          0.0, -70, 0.0),
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(
                                          Icons.cancel_sharp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    floatingActionButtonLocation:
                                        FloatingActionButtonLocation.centerTop,
                                  );
                                },
                              );
                            },
                            child: const Text(
                              "Checkout",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
