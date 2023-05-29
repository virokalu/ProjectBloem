import 'package:flutter/material.dart';
import 'package:project_bloem/components/size.dart';
import '../../components/back_button_icon.dart';
//import '../../components/button_components.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // double priceOne = 1000;
    // double priceTwo = 1000;
    // double priceThree = 1000;
    // double priceFour = 1000;
    // double priceFive = 1000;
    // double priceSix = 1000;
    // double priceSeven = 1000;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: width / 90,
                horizontal: height / 90,
              ),
              child: Column(
                children: [
                  const ButtonText(
                      text: "Wish List", icon: Icons.favorite_border),
                  const SizedBox(height: 30,),
                  SizedBox(
                    height: height * 0.38,
                    child: const SingleChildScrollView(
                      child: Column(children: [

                        SizedBox(height:20),

                        Icon(
                          Icons.construction_outlined,
                          color: Colors.grey,
                          size: 60,
                        ),
                        SizedBox(height:20),
                        Center(
                          child: Text(
                            "Under Construction !!!",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'poppins',
                              color: Colors.grey,
                            ),
                          ),

                        ),
                        // SafeArea(
                        //     child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     SizedBox(
                        //       height: height / 7,
                        //       width: width / 7,
                        //       child: const Image(
                        //         image: AssetImage('image/112.jpg'),
                        //         fit: BoxFit.fill,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: height / 7,
                        //       child: const Column(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Text(
                        //             'Name here',
                        //             textAlign: TextAlign.left,
                        //             style: TextStyle(
                        //               fontSize: 20.0,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //           Text(
                        //             "Rs.1000",
                        //             style: TextStyle(
                        //               fontSize: 18.0,
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //     IconButton(
                        //         onPressed: () {},
                        //         icon: const Icon(Icons.add_circle)),
                        //     IconButton(
                        //         onPressed: () {},
                        //         icon: const Icon(Icons.remove_circle_outline)),
                        //   ],
                        // )),
                        // const Divider(
                        //   height: 0.1,
                        // ),
                        // SafeArea(
                        //     child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     SizedBox(
                        //       height: height / 7,
                        //       width: width / 7,
                        //       child: const Image(
                        //         image: AssetImage('image/112.jpg'),
                        //         fit: BoxFit.fill,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: height / 7,
                        //       child: const Column(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Text(
                        //             'Name here',
                        //             textAlign: TextAlign.left,
                        //             style: TextStyle(
                        //               fontSize: 20.0,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //           Text(
                        //             "Rs.2000",
                        //             style: TextStyle(
                        //               fontSize: 18.0,
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //     IconButton(
                        //         onPressed: () {},
                        //         icon: const Icon(Icons.add_circle)),
                        //     IconButton(
                        //         onPressed: () {},
                        //         icon: const Icon(Icons.remove_circle_outline)),
                        //   ],
                        // )),
                        // const Divider(
                        //   height: 0.1,
                        // ),
                        // SafeArea(
                        //     child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     SizedBox(
                        //       height: height / 7,
                        //       width: width / 7,
                        //       child: const Image(
                        //         image: AssetImage('image/112.jpg'),
                        //         fit: BoxFit.fill,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: height / 7,
                        //       child: const Column(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Text(
                        //             'Name here',
                        //             textAlign: TextAlign.left,
                        //             style: TextStyle(
                        //               fontSize: 20.0,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //           Text(
                        //             "Rs.2000",
                        //             style: TextStyle(
                        //               fontSize: 18.0,
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //     IconButton(
                        //         onPressed: () {},
                        //         icon: const Icon(Icons.add_circle)),
                        //     IconButton(
                        //         onPressed: () {},
                        //         icon: const Icon(Icons.remove_circle_outline)),
                        //   ],
                        // )),
                      ]),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
