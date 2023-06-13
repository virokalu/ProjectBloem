// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/components/size.dart';
import 'package:project_bloem/components/widget_cart_item.dart';
import 'package:project_bloem/models/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';
import '../../models/cart_item.dart';
import '../../provider.dart';

class MyBasketScreen extends ConsumerStatefulWidget {
  const MyBasketScreen({Key? key}) : super(key: key);

  @override
  _MyBasketScreenState createState() => _MyBasketScreenState();
}

class _MyBasketScreenState extends ConsumerState<MyBasketScreen> {
  late SharedPreferences preference;
  String? username;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    preference = await SharedPreferences.getInstance();
    //String? fullname=preference.getString('fullname');
    String? username=preference.getString('username');
    String? token = preference.getString('token');
    //print(token);

    if (token == null) {
      //print(token);

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/login');
    }
    setState(() =>this.username=username!);
    //setState(() =>this.fullname=fullname!);
  }

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
    //
    // double total = priceOne +
    //     priceTwo +
    //     priceThree +
    //     priceFour +
    //     priceFive +
    //     priceSix +
    //     priceSix +
    //     priceSeven;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: width / 90, horizontal: height / 90),
              child: Column(
                children: [
                  const ButtonText(text: "My Basket", icon: Icons.shopping_cart),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: getProportionateScreenHeight(500),
                    child: SizedBox(
                      child: SingleChildScrollView(

                                //flex: 1,
                                child: _cartList(ref),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     const CircleAvatar(
                                //       radius: 30,
                                //       backgroundImage:
                                //           AssetImage('images/background1.jpg'),
                                //     ),
                                //     SizedBox(
                                //       height: height / 7,
                                //       child: const Column(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceAround,
                                //         children: [
                                //           Text(
                                //             "Name Here",
                                //             textAlign: TextAlign.left,
                                //             style: TextStyle(
                                //               fontSize: 20.0,
                                //               fontWeight: FontWeight.bold,
                                //             ),
                                //           ),
                                //           Text(
                                //             "Quantity Here",
                                //             textAlign: TextAlign.left,
                                //             style: TextStyle(
                                //               fontSize: 18.0,
                                //             ),
                                //           )
                                //         ],
                                //       ),
                                //     ),
                                //     Text(
                                //       "Rs.$priceOne",
                                //       style: const TextStyle(
                                //         fontSize: 18.0,
                                //       ),
                                //     ),
                                //     IconButton(
                                //       icon: const Icon(
                                //           Icons.remove_circle_outline_sharp),
                                //       onPressed: () {
                                //         //total = total - priceOne;
                                //       },
                                //     )
                                //   ],
                                // ),
                              ),
                              // const Divider(
                              //   height: 0.1,
                              // ),
                              // SafeArea(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       SizedBox(
                              //         height: height / 7,
                              //         width: width / 7,
                              //         child: const CircleAvatar(
                              //           radius: 30,
                              //           backgroundImage:
                              //               AssetImage('images/background1.jpg'),
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         height: height / 7,
                              //         child: const Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceAround,
                              //           children: [
                              //             Text(
                              //               "Name Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 20.0,
                              //                 fontWeight: FontWeight.bold,
                              //               ),
                              //             ),
                              //             Text(
                              //               "Quantity Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 18.0,
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       Text(
                              //         "Rs.$priceTwo",
                              //         style: const TextStyle(
                              //           fontSize: 18.0,
                              //         ),
                              //       ),
                              //       IconButton(
                              //         icon: const Icon(
                              //             Icons.remove_circle_outline_sharp),
                              //         onPressed: () {},
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // const Divider(
                              //   height: 0.1,
                              // ),
                              // SafeArea(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       SizedBox(
                              //         height: height / 7,
                              //         width: width / 7,
                              //         child: const CircleAvatar(
                              //           radius: 30,
                              //           backgroundImage:
                              //               AssetImage('images/background1.jpg'),
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         height: height / 7,
                              //         child: const Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceAround,
                              //           children: [
                              //             Text(
                              //               "Name Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 20.0,
                              //                 fontWeight: FontWeight.bold,
                              //               ),
                              //             ),
                              //             Text(
                              //               "Quantity Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 18.0,
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       Text(
                              //         "Rs.$priceThree",
                              //         style: const TextStyle(
                              //           fontSize: 18.0,
                              //         ),
                              //       ),
                              //       IconButton(
                              //         icon: const Icon(
                              //             Icons.remove_circle_outline_sharp),
                              //         onPressed: () {},
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // const Divider(
                              //   height: 0.1,
                              // ),
                              // SafeArea(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       SizedBox(
                              //         height: height / 7,
                              //         width: width / 7,
                              //         child: const CircleAvatar(
                              //           radius: 30,
                              //           backgroundImage:
                              //               AssetImage('images/background1.jpg'),
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         height: height / 7,
                              //         child: const Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceAround,
                              //           children: [
                              //             Text(
                              //               "Name Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 20.0,
                              //                 fontWeight: FontWeight.bold,
                              //               ),
                              //             ),
                              //             Text(
                              //               "Quantity Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 18.0,
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       Text(
                              //         "Rs.$priceFour",
                              //         style: const TextStyle(
                              //           fontSize: 18.0,
                              //         ),
                              //       ),
                              //       IconButton(
                              //         icon: const Icon(
                              //             Icons.remove_circle_outline_sharp),
                              //         onPressed: () {},
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // const Divider(
                              //   height: 0.1,
                              // ),
                              // SafeArea(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       SizedBox(
                              //         height: height / 7,
                              //         width: width / 7,
                              //         child: const CircleAvatar(
                              //           radius: 30,
                              //           backgroundImage:
                              //               AssetImage('images/background1.jpg'),
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         height: height / 7,
                              //         child: const Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceAround,
                              //           children: [
                              //             Text(
                              //               "Name Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 20.0,
                              //                 fontWeight: FontWeight.bold,
                              //               ),
                              //             ),
                              //             Text(
                              //               "Quantity Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 18.0,
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       Text(
                              //         "Rs.$priceFive",
                              //         style: const TextStyle(
                              //           fontSize: 18.0,
                              //         ),
                              //       ),
                              //       IconButton(
                              //         icon: const Icon(
                              //             Icons.remove_circle_outline_sharp),
                              //         onPressed: () {},
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // const Divider(
                              //   height: 0.1,
                              // ),
                              // SafeArea(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       SizedBox(
                              //         height: height / 7,
                              //         width: width / 7,
                              //         child: const CircleAvatar(
                              //           radius: 30,
                              //           backgroundImage:
                              //               AssetImage('images/background1.jpg'),
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         height: height / 7,
                              //         child: const Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceAround,
                              //           children: [
                              //             Text(
                              //               "Name Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 20.0,
                              //                 fontWeight: FontWeight.bold,
                              //               ),
                              //             ),
                              //             Text(
                              //               "Quantity Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 18.0,
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       Text(
                              //         "Rs.$priceSix",
                              //         style: const TextStyle(
                              //           fontSize: 18.0,
                              //         ),
                              //       ),
                              //       IconButton(
                              //         icon: const Icon(
                              //             Icons.remove_circle_outline_sharp),
                              //         onPressed: () {},
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // const Divider(
                              //   height: 0.1,
                              // ),
                              // SafeArea(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       SizedBox(
                              //         height: height / 7,
                              //         width: width / 7,
                              //         child: const CircleAvatar(
                              //           radius: 30,
                              //           backgroundImage:
                              //               AssetImage('images/background1.jpg'),
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         height: height / 7,
                              //         child: const Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceAround,
                              //           children: [
                              //             Text(
                              //               "Name Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 20.0,
                              //                 fontWeight: FontWeight.bold,
                              //               ),
                              //             ),
                              //             Text(
                              //               "Quantity Here",
                              //               textAlign: TextAlign.left,
                              //               style: TextStyle(
                              //                 fontSize: 18.0,
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       Text(
                              //         "Rs.$priceSeven",
                              //         style: const TextStyle(
                              //           fontSize: 18.0,
                              //         ),
                              //       ),
                              //       IconButton(
                              //         icon: const Icon(
                              //             Icons.remove_circle_outline_sharp),
                              //         onPressed: () {},
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // const Divider(
                              //   height: 0.1,
                              // ),

                          ),
                    ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _CheckOutNavbar()
            )
          ],
        ),
      ),
    );
  }

  // Widget to build each individual cart item
  Widget _buildCartItem(CartItem model, WidgetRef ref) {
    return CartItemWidget(
      model: model,
      onQtyUpdate: (CartItem model, qty, type) {
        final cartViewModel = ref.read(cartItemsProvider.notifier);
        cartViewModel.updateQty(model.item.id, qty, type, username);
      },
      onItemRemove: (CartItem model) {
        final cartViewModel = ref.read(cartItemsProvider.notifier);
        cartViewModel.removeCartItem(model.item.id, model.qty, username);
      },
    );
  }
// Widget to build the list of cart items
  Widget _buildCartItems(List<CartItem> cartItems, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return _buildCartItem(cartItems[index], ref);
      },
    );
  }
// Widget to display the cart list
  Widget _cartList(WidgetRef ref) {
    final cartState = ref.watch(cartItemsProvider);

    if (cartState.cartModel == null) {
      return const LinearProgressIndicator();
    }

    if (cartState.cartModel!.items.isEmpty) {
      return const Center(
        child: Text("Basket Empty"),
      );
    }

    return _buildCartItems(cartState.cartModel!.items, ref);
  }


}
class _CheckOutNavbar extends ConsumerWidget{
  @override
  Widget build(BuildContext context,WidgetRef ref){
    final cartProvider = ref.watch(cartItemsProvider);
    if(cartProvider.cartModel != null){
      return cartProvider.cartModel!.items.isNotEmpty
          ? Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(70),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  //height: height * 0.2,
                  width: getProportionateScreenWidth(120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins'
                        ),
                      ),
                      Text(
                        "Rs.${cartProvider.cartModel!.grandTotal.toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 23,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width:getProportionateScreenWidth(70)),
                SizedBox(
                  width: getProportionateScreenWidth(150),
                  child: TextButton(
                    style: greenButtonStyle,
                    onPressed: () {
                      //   showModalBottomSheet(
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20.0),
                      //     ),
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return Scaffold(
                      //         body: Column(
                      //           children: [
                      //             Container(
                      //               margin: const EdgeInsets.fromLTRB(
                      //                   10.0, 0, 10.0, 0),
                      //               height: height * 0.5,
                      //               width: width,
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       const SizedBox(
                      //                         height: 20.0,
                      //                       ),
                      //                       Column(
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment
                      //                                 .start,
                      //                         children: [
                      //                           const Text(
                      //                             "Card Holder's Name",
                      //                             style: TextStyle(
                      //                               fontSize: 20,
                      //                               fontWeight:
                      //                                   FontWeight.bold,
                      //                             ),
                      //                           ),
                      //                           const SizedBox(
                      //                             height: 15.0,
                      //                           ),
                      //                           TextFormField(
                      //                             decoration:
                      //                                 InputDecoration(
                      //                               hintText: "Manoj ABC",
                      //                               filled: true,
                      //                               fillColor:
                      //                                   Colors.white38,
                      //                               border:
                      //                                   OutlineInputBorder(
                      //                                 borderRadius:
                      //                                     BorderRadius
                      //                                         .circular(
                      //                                             20),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ],
                      //                   ),
                      //                   const SizedBox(
                      //                     height: 25.0,
                      //                   ),
                      //                   Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       Column(
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment
                      //                                 .start,
                      //                         children: [
                      //                           const Text(
                      //                             "Card Number",
                      //                             style: TextStyle(
                      //                               fontSize: 20,
                      //                               fontWeight:
                      //                                   FontWeight.bold,
                      //                             ),
                      //                           ),
                      //                           const SizedBox(
                      //                             height: 15.0,
                      //                           ),
                      //                           TextFormField(
                      //                             decoration:
                      //                                 InputDecoration(
                      //                               filled: true,
                      //                               hintText:
                      //                                   'xxxx xxxx xxxx xxxx',
                      //                               fillColor:
                      //                                   Colors.white38,
                      //                               border:
                      //                                   OutlineInputBorder(
                      //                                 borderRadius:
                      //                                     BorderRadius
                      //                                         .circular(
                      //                                             20),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ],
                      //                   ),
                      //                   const SizedBox(
                      //                     height: 25.0,
                      //                   ),
                      //                   Row(
                      //                     //crossAxisAlignment:CrossAxisAlignment.start,
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment
                      //                             .spaceBetween,
                      //                     children: [
                      //                       SizedBox(
                      //                         width: width * 0.3,
                      //                         child: Column(children: [
                      //                           Column(
                      //                             crossAxisAlignment:
                      //                                 CrossAxisAlignment
                      //                                     .start,
                      //                             children: [
                      //                               Column(
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment
                      //                                         .start,
                      //                                 children: [
                      //                                   const Text(
                      //                                     "Date",
                      //                                     style:
                      //                                         TextStyle(
                      //                                       fontSize: 20,
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .bold,
                      //                                     ),
                      //                                   ),
                      //                                   const SizedBox(
                      //                                     height: 15.0,
                      //                                   ),
                      //                                   TextFormField(
                      //                                     decoration:
                      //                                         InputDecoration(
                      //                                       hintText:
                      //                                           "10/30",
                      //                                       filled: true,
                      //                                       fillColor: Colors
                      //                                           .white38,
                      //                                       border:
                      //                                           OutlineInputBorder(
                      //                                         borderRadius:
                      //                                             BorderRadius.circular(
                      //                                                 20),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ]),
                      //                       ),
                      //                       SizedBox(
                      //                         width: width * 0.3,
                      //                         child: Column(children: [
                      //                           Column(
                      //                             crossAxisAlignment:
                      //                                 CrossAxisAlignment
                      //                                     .start,
                      //                             children: [
                      //                               Column(
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment
                      //                                         .start,
                      //                                 children: [
                      //                                   const Text(
                      //                                     "CCV",
                      //                                     style:
                      //                                         TextStyle(
                      //                                       fontSize: 20,
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .bold,
                      //                                     ),
                      //                                   ),
                      //                                   const SizedBox(
                      //                                     height: 15.0,
                      //                                   ),
                      //                                   TextFormField(
                      //                                     decoration:
                      //                                         InputDecoration(
                      //                                       hintText:
                      //                                           "548",
                      //                                       filled: true,
                      //                                       fillColor: Colors
                      //                                           .white38,
                      //                                       border:
                      //                                           OutlineInputBorder(
                      //                                         borderRadius:
                      //                                             BorderRadius.circular(
                      //                                                 20),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ]),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                   const SizedBox(
                      //                     height: 25.0,
                      //                   ),
                      //                   Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment
                      //                             .spaceBetween,
                      //                     children: [
                      //                       SizedBox(
                      //                         //height: height * 0.1,
                      //                         width: width * 0.4,
                      //                         child: TextButton(
                      //                           style: greenButtonStyle,
                      //                           onPressed: () {},
                      //                           child: const Text(
                      //                             "Cash on Delivery",
                      //                             style: TextStyle(
                      //                                 color: Colors.white,
                      //                                 fontSize: 18.0),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       SizedBox(
                      //                         //height: height * 0.1,
                      //                         width: width * 0.4,
                      //                         child: TextButton(
                      //                           style:
                      //                               greenButtonBorderStyle,
                      //                           //style: ButtonStyle(),
                      //                           onPressed: () {},
                      //                           child: const Text(
                      //                             "Complete Order",
                      //                             style: TextStyle(
                      //                                 color: Colors.green,
                      //                                 fontSize: 18.0),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         floatingActionButton: Container(
                      //           transform: Matrix4.translationValues(
                      //               0.0, -70, 0.0),
                      //           child: FloatingActionButton(
                      //             backgroundColor: Colors.white,
                      //             onPressed: () {
                      //               Navigator.pop(context);
                      //             },
                      //             child: const Icon(
                      //               Icons.cancel_sharp,
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ),
                      //         floatingActionButtonLocation:
                      //             FloatingActionButtonLocation.centerTop,
                      //       );
                      //     },
                      //   );
                    },
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white, fontSize: 16.0,
                        fontFamily: 'Poppins',),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ): const SizedBox(
        child: Text(" "),
      );

    }else{
      return const Text("");
    }

  }


}


