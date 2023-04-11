import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';

class MyBasketScreen extends StatefulWidget {
  const MyBasketScreen({Key? key}) : super(key: key);

  @override
  State<MyBasketScreen> createState() => _MyBasketScreenState();
}


class _MyBasketScreenState extends State<MyBasketScreen> {
  late SharedPreferences preference;

  @override
  void initState(){
    super.initState();
    init();
  }
  Future init() async{
    preference = await SharedPreferences.getInstance();
    //String? fullname=preference.getString('fullname');
    //String? username=preference.getString('username');
    String? token=preference.getString('token');
    //print(token);

    if(token==null){
      //print(token);

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/login');
    }
    //setState(() =>this.username=username!);
    //setState(() =>this.fullname=fullname!);

  }
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
                  const ButtonText(text: "My Basket", icon: Icons.shopping_cart),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: height * 0.38,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage('images/background1.jpg'),
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
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage('images/background1.jpg'),
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
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage('images/background1.jpg'),
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
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage('images/background1.jpg'),
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
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage('images/background1.jpg'),
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
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage('images/background1.jpg'),
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
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage('images/background1.jpg'),
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
                          //height: height * 0.1,
                          width: width * 0.4,
                          child: TextButton(
                            style: greenButtonStyle,
                            onPressed: () {},
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

