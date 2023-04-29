import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_bloem/components/button_components.dart';
import 'package:project_bloem/components/color_components.dart';
import 'package:project_bloem/screens/item_view/item_view_component.dart';
import 'package:http/http.dart' as http;

/////////////////////////////
//import 'package:stripe_payment/stripe_payment.dart';
/////////////////////////////

import '../../config.dart';
import '../../payment.dart';
//import '../../models/item.dart';

String? imgOne;
String? imgTwo;
String? imgThree;
bool imageAdded = true;
bool _isLoading = true;

class ItemViewNew extends StatefulWidget {
  final String id;
  const ItemViewNew({super.key,required this.id});
 

  @override
  State<ItemViewNew> createState() => _ItemViewNewState();
}

class _ItemViewNewState extends State<ItemViewNew> {

  // ignore: prefer_typing_uninitialized_variables
  var data;
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cardholderController = TextEditingController();
  final cardnumberController = TextEditingController();
  final dateController = TextEditingController();
  final ccvController = TextEditingController();
  int counter = 0;
  

  Future<void> fetchItemData() async {
    // ignore: prefer_interpolation_to_compose_strings
    setState(() {
      _isLoading = true;
    });
    try{
      // ignore: prefer_interpolation_to_compose_strings
      final url = Uri.parse(itemAdd+"/"+widget.id);
      final response = await http.get(url);
      if(response.statusCode == 200){
        data = jsonDecode(response.body);
      }
    }
    catch(e){
      // ignore: avoid_print
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> registerBuyItem() async {
    var reqbody = {
      "street" : streetController.text,
      "town" : cityController.text,
      "postalCode" : postalCodeController.text,
      "username" : data["data"]["username"],
      "id" : widget.id,
    };

    final url = Uri.parse(regBuyItem);
    // ignore: unused_local_variable
    var response = await http.post(
      url,
      headers: {"Content-Type":"application/json",
          "Access-Control-Allow-Origin": "*"
      },
      body: jsonEncode(reqbody),
    );

    // var jsonresponse = jsonDecode(response.body);
    // (jsonresponse.status);
    // if(jsonresponse.status){
    //   print("success");
    // }
    // else{
    //   print("not success");
    // }
  }

  Future<void> registeCard() async {
    var reqbody = {
      "cardholdername" : cardholderController.text,
      "cardnumber" : cardnumberController.text,
      "date" : dateController.text,
      "ccv" : ccvController.text,
      "username" : widget.id,
    };

    final url = Uri.parse(regBuyItem);
    // ignore: unused_local_variable
    var response = await http.post(
      url,
      headers: {"Content-Type":"application/json",
          "Access-Control-Allow-Origin": "*"
      },
      body: jsonEncode(reqbody),
    );

    // var jsonresponse = jsonDecode(response.body);
    // (jsonresponse.status);
    // if(jsonresponse.status){
    //   print("success");
    // }
    // else{
    //   print("not success");
    // }
  }

   @override
  void initState() {
    super.initState();
    fetchItemData();
    registerBuyItem();
  }

  late Map<String,dynamic> paymentIntent; 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    int currentIndex = 0;
     //List<String> images = ['$imgOne', '$imgTwo', '$imgThree'];
    List<String> images = data == null ? [] : [data["data"]["imgone"], data["data"]["imgtwo"], data["data"]["imgthree"]];
    // ignore: no_leading_underscores_for_local_identifiers
    final PageController _pageController = PageController(initialPage: 0);

    return SafeArea(
        child: Scaffold(
        body: _isLoading 
                ? const Center(child: CircularProgressIndicator())
                : Container(
        margin: EdgeInsets.all(width / 30),
        child: Column(children: [
          ItemViewComponents(text: data["data"]["commonname"],category: data["data"]["category"],),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.7,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    String? image = images[index];
                    if (image != 'null' && image.isNotEmpty) {
                      return Image.network(
                        image,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Positioned(
                left: 0,
                top: MediaQuery.of(context).size.width * 0.35,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: HexColor.fromHex('#4CD964'),
                  onPressed: () {
                    setState(() {
                      currentIndex = (currentIndex - 1) % images.length;
                    });
                    _pageController.animateToPage(
                      currentIndex,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
              Positioned(
                right: 0,
                top: MediaQuery.of(context).size.width * 0.35,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  color: HexColor.fromHex('#4CD964'),
                  onPressed: () {
                    setState(() {
                      currentIndex = (currentIndex + 1) % images.length;
                    });
                    _pageController.animateToPage(
                      currentIndex,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
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
              child:Column(
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      data["data"]["description"],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                // ignore: prefer_interpolation_to_compose_strings
                "Rs."+data["data"]["price"].toString(),
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.left,
              ),
              Spacer(),
              TextButton(
                onPressed: (){
                  if(counter > 1){
                    setState(() {
                      counter--;
                    });
                  }
                }, 
                child: Text("-")
              ),
              Text(counter.toString()),
              TextButton(
                onPressed: (){
                  if(counter < 5){
                    setState(() {
                      counter++;
                    });
                  }
                }, 
                child: Text("+")
              ),
            ],
          ),
          const SizedBox(
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
                        
                        openDialog();
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

  Future openDialog() => showDialog(
    builder: (context) => AlertDialog(
      title: const Text("Enter your location for deliver"),
      content: SizedBox(
        height: MediaQuery.of(context).size.height/4,
        child: ListView(
          children: [
          TextFormField(
              controller: streetController,
              decoration: const InputDecoration(hintText: "Street Name"),
          ),
          TextFormField(
              controller: cityController,
              decoration: const InputDecoration(hintText: "Town Name"),
          ),
          TextFormField(
              controller: postalCodeController,
              decoration: const InputDecoration(hintText: "Postal Code"),
          ),
        ],
        ),
      ),
      actions: [
        TextButton(
          // onPressed: () {
          //   setState(() {
          //     registerBuyItem();
          //   });
            // streetController.clear();
            // cityController.clear();
            // postalCodeController.clear();
          //   //open2Dialog();
              // Navigator.of(context).pop();
          //   // showModalBottomSheet(
          //   //               context: context,
          //   //               builder: (context) => bottomesheet(),
          //   //               backgroundColor: Colors.white,
          //   //             );
          // }, 
              onPressed : () {
                  streetController.clear();
                  cityController.clear();
                  postalCodeController.clear();
                  Navigator.of(context).pop();
                  setState(() {
                      PaymentSheet payment = PaymentSheet(amount: (data["data"]["price"]*counter).toString(), context: context);
                      payment.makePayment();
                  });
              },
          child: const Text("Next")
        ),
      ],
    ), 
    context: context,
  );

  // Future<void> makePayment() async {
  //   try{
  //     paymentIntent = await createPaymentIntent((data["data"]["price"]*counter).toString(),'USD');
  //     await Stripe.instance.initPaymentSheet(
  //       paymentSheetParameters: SetupPaymentSheetParameters(
  //         paymentIntentClientSecret: paymentIntent['client_secret'],
  //         // applePay: const PaymentSheetApplePay(merchantCountryCode: '+94'),
  //         // googlePay: const PaymentSheetGooglePay(testEnv: true,currencyCode: 'USD',merchantCountryCode: '+94'),
  //         style: ThemeMode.dark,
  //         merchantDisplayName: 'manoj')).then((value){
  //       });

  //       displayPaymentSheet();
  //   }
  //   catch(e){
  //     // ignore: avoid_print
  //     print(e);
  //   }
  // }

  // displayPaymentSheet() async {
  //   try{
  //     await Stripe.instance.presentPaymentSheet(
  //     ).then((value) {
  //       showDialog(
  //         context: context, 
  //         builder: (_) => const AlertDialog(
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Row(
  //                 children: [
  //                   Icon(Icons.check_circle,color: Colors.green,),
  //                   Text("payment Successfully"),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         )

  //       );
  //     }).onError((error, stackTrace) {
  //         // ignore: avoid_print
  //         print("error=>>>$error $stackTrace");
  //     } );
  //   } on StripeException catch(e) {
  //     // ignore: avoid_print
  //     print(e);

  //     showDialog(
  //       context: context, 
  //       builder: (_) => const AlertDialog(
  //         content: Text("concelled"),
  //       ));
  //   }catch(e){
  //     // ignore: avoid_print
  //     print(e);
  //   }
    
  // }

  // createPaymentIntent(String amount,String currency) async {
  //   try{
  //     Map<String,dynamic> body = {
  //       'amount' : calculateAmount(amount),
  //       'currency' : currency,
  //       'payment_method_types[]' : 'card',
  //     };

  //     var response = await http.post(
  //       Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //       headers: {
  //         'Authorization' : 'Bearer sk_test_51MlHd3KwlHMvGTglr20L5y1pZ4gFuriGRzxf6al9G0LIHQzAQyRX06PcLp54SG2TcAGtzku5ac6azSHgeEZB5TkV002PvcFuq0',
  //         'Contert-Type' : 'application/x-www-form-urlencoded'
  //       },
  //       body: body,
  //     );
  //     // ignore: avoid_print
  //     print('payment Intent body->>>${response.body.toString()}');
  //     return jsonDecode(response.body);
  //   }
  //   catch(e){
  //     // ignore: avoid_print
  //     print(e);
  //   }
  // }

  // calculateAmount(String amount) {
  //   final calculateAmount = (int.parse(amount))*100 ;
  //   return calculateAmount.toString();
  // }

  

//button click action for buy now button
  // Widget bottomesheet() {
  //   return SizedBox(
  //     height: MediaQuery.of(context).size.height / 2,
  //     width: MediaQuery.of(context).size.width,
  //     child: Card(
  //       margin: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
  //       child: ListView(
  //         children: [
  //           Column(
  //             children: [
  //               const Text("Card Holder name"),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               TextFormField(
  //                 controller : cardholderController,
  //                 decoration: InputDecoration(
  //                     hintText: "Manoj Lakshan",
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(20),
  //                     )),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               const Text("Card Number"),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               TextFormField(
  //                 controller : cardnumberController,
  //                 decoration: InputDecoration(
  //                     hintText: "1234 5678 9012",
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(20),
  //                     )),
  //                 keyboardType: TextInputType.number,
  //               ),
  //               const SizedBox(height: 20),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: Column(
  //                       children: [
  //                         const Text("Date"),
  //                         const SizedBox(
  //                           height: 20,
  //                         ),
  //                         TextFormField(
  //                           controller : dateController,
  //                           decoration: InputDecoration(
  //                               hintText: "04/03",
  //                               border: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                               )),
  //                           keyboardType:
  //                               const TextInputType.numberWithOptions(),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   const SizedBox(width: 80),
  //                   Expanded(
  //                     child: Column(
  //                       children: [
  //                         const Text("CCV"),
  //                         const SizedBox(
  //                           height: 20,
  //                         ),
  //                         TextFormField(
  //                           controller : ccvController,
  //                           decoration: InputDecoration(
  //                               hintText: "123",
  //                               border: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                               )),
  //                           keyboardType: TextInputType.number,
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: TextButton(
  //                       style: greenButtonStyle,
  //                       onPressed: () {},
  //                       child: const Text(
  //                         "Cash on Delivery",
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 16.0,
  //                           fontFamily: 'Poppins',
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(width: 20),
  //                   Expanded(
  //                     child: TextButton(
  //                       style: greenButtonBorderStyle,
  //                       onPressed: () {},
  //                       child: Text(
  //                         "Complete Order",
  //                         style: TextStyle(
  //                           color: HexColor.fromHex('#4CD964'),
  //                           fontSize: 16.0,
  //                           fontFamily: 'Poppins',
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
