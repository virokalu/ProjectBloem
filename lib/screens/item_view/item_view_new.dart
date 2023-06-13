import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:project_bloem/components/button_components.dart';
import 'package:project_bloem/components/color_components.dart';
import 'package:project_bloem/components/widget_custom_stepper.dart';
import 'package:project_bloem/provider.dart';
import 'package:project_bloem/screens/item_view/item_view_component.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mailer/mailer.dart' as mail;
import 'package:mailer/smtp_server.dart';
import '../../components/size.dart';
import '../../config.dart';

String? imgOne;
String? imgTwo;
String? imgThree;
bool imageAdded = true;
bool _isLoading = true;

class ItemViewNew extends ConsumerStatefulWidget {
  final String id;
  const ItemViewNew({super.key, required this.id});

  @override
  _ItemViewNewState createState() => _ItemViewNewState();
}

class _ItemViewNewState extends ConsumerState<ItemViewNew> {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  var userinfo;

  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cardholderController = TextEditingController();
  final cardnumberController = TextEditingController();
  final dateController = TextEditingController();
  final ccvController = TextEditingController();
  int counter = 1;
  late SharedPreferences preference;
  String username = "";
  String? fullname;
  String? email;
  bool showText = true;

  //////////////////send email to seller ////////////////////////

  void sendEmail() async {
    final smtpServer = SmtpServer('mail.smtp2go.com',
        username: 'projectBloem',
        password: '51NmMSln01HhBNRq',
        port: 2525, // Use the appropriate port number for your SMTP server
        ssl: false);

    // Create the email message
    print(userinfo["email"]);
    final message = mail.Message()
      ..from = const mail.Address(emailSender)
      ..recipients.add(userinfo["email"])
      ..subject = 'Buyer Information by Project_Bloem'
      ..html = '''
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      background-color: #ffffff;
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    
    .card-box {
      width: 190px;
      height: 250px;
      margin-left: 5px;
      margin-bottom: 5px;
      background-color: #ffffff;
      border-radius: 20px;
      box-shadow: 0px 25px 40px rgba(0, 0, 0, 0.2);
    }
    
    .card-box__image {
      position: relative;
      width: 100%;
      padding-left: 15px;
      padding-right: 15px;
    }
    
    .card-box__image img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-radius: 10px;
    }
    
    .card-box__content {
      padding: 10px 15px;
    }
    
    .card-box__title {
      font-size: 17px;
      font-weight: bold;
      color: #000000;
      margin-top: 10px;
    }
    
    .card-box__price {
      font-size: 17px;
      font-weight: 400;
      color: #4cd964;
      margin-top: 10px;
    }
    
    .card-box__button {
      display: inline-block;
      margin-top: 10px;
      padding: 5px;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background-color: #e7ffed;
      text-align: center;
    }
    
    .card-box__button i {
      color: #4cd964;
      font-size: 20px;
    }
    
    .details {
      margin-top: 20px;
    }
    
    .details__item {
      font-size: 14px;
      color: #808080;
      margin-bottom: 5px;
    }
  </style>
</head>
<body>

  <div class="details">
     <p class="details__item">Hello <b>${userinfo["fullname"]}</b> Your Product <b>${data["data"]["commonname"]}</b> just Purchased by <b>$fullname</b></p>
  </div>
  <div class="card-box">
    <div class="card-box__image">
      <img src="${data["data"]["imgone"]}" alt="Product Image">
    </div>
    <div class="card-box__content">
      <h3 class="card-box__title">${data["data"]["commonname"]}</h3>
      <p class="card-box__price">Price: Rs. ${data["data"]["price"]}</p>
      
    </div>
  </div>
  
  <div class="details">
    
    <p class="details__item">Buyer UserName: <b>$username</b></p>
    <p class="details__item">Delivery Address: <b>${streetController.text}, ${cityController.text}, ${postalCodeController.text}</b></p>
    <p class="details__item">Buyer Email: <b>$email</b></p>
    <p class="details__item">Please make Further arrangements to Deliver this item</p>
    
  </div>
</body>
</html>''';

    try {
      await mail.send(message, smtpServer);
      setState(() {
        //emailSent=true;
      });
    } catch (e) {
      print('Failed to send OTP: $e');
    }
  }

  ///////////////////////////////////////////////////////////////

  Future init() async {
    preference = await SharedPreferences.getInstance();
    String? token = preference.getString('token');

    if (token == null) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/login');
    }else{
      fetchItemData();

    }
    //setState(() =>this.sellerStates=sellerStates!);
    //setState(() =>this.fullname=fullname!);
  }

////////////////////////////////////////////////////////////////

  // Future<void> updateItemQty(String itemid,String qty) async {
  //       final Map<String,dynamic> requestBody = {
  //         "quantity" : qty,
  //       };


  //       final String encodeBody = jsonEncode(requestBody);
  //       print(encodeBody);

  //       final response = await http.put(
  //           // ignore: prefer_interpolation_to_compose_strings
  //           Uri.parse(updQty+itemid),
  //           headers: {
  //               'Content-Type': 'application/json',
  //           },

  //       body: encodeBody,
  //       );

  //       preference.setBool("sellerStates", true);
  //   }

////////////////////////////////////////////////////////////////

  void toggleTextAndIcon() {
    setState(() {
      showText = !showText;
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        showText = true;
      });
    });
  }


  Future<void> fetchItemData() async {
    // ignore: prefer_interpolation_to_compose_strings
    setState(() {
      _isLoading = true;
    });
    try {
      preference = await SharedPreferences.getInstance();
      String? username = preference.getString('username');
      String? fullname = preference.getString('fullname');
      String? email = preference.getString('email');
      setState(() => this.username = username!);
      setState(() => this.fullname = fullname!);
      setState(() => this.email = email!);
      // ignore: prefer_interpolation_to_compose_strings
      final url = Uri.parse(itemAdd + "/" + widget.id);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        print(data.toString());
      }
      getEmail();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> registerBuyItem() async {
    var reqbody = {
      "street": streetController.text,
      "town": cityController.text,
      "postalCode": postalCodeController.text,
      "sellername": data["data"]["username"],
      "buyername": username,
      "itemid": widget.id,
      "itemprice": data["data"]["price"],
      "category" : data["data"]["category"],
    };

    final url = Uri.parse(regBuyItem);
    // ignore: unused_local_variable
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
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
  }  Future<void> getEmail() async {
    var emailBody = {
      "username": data["data"]["username"],
    };

    final url = Uri.parse(getEmailURL);
    // ignore: unused_local_variable
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
      body: jsonEncode(emailBody),
    );

    userinfo = jsonDecode(response.body);

    print(userinfo.toString());

    // if(userDetails.status){
    //
    //     sellerEmail=jsonResponse['email'].toString();
    //     sellerName=jsonResponse['fullname'];
    //     sellerUsername=jsonResponse['username'];
    //
    // }
  }

  Future<void> registeCard() async {
    var reqbody = {
      "cardholdername": cardholderController.text,
      "cardnumber": cardnumberController.text,
      "date": dateController.text,
      "ccv": ccvController.text,
      "username": widget.id,
    };

    final url = Uri.parse(regBuyItem);
    // ignore: unused_local_variable
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
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
    init();
    //fetchItemData();
    //getEmail();
  }

  late Map<String, dynamic> paymentIntent;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    int currentIndex = 0;
    //List<String> images = ['$imgOne', '$imgTwo', '$imgThree'];
    List<String> images = data == null
        ? []
        : [
            data["data"]["imgone"],
            data["data"]["imgtwo"],
            data["data"]["imgthree"]
          ];
    // ignore: no_leading_underscores_for_local_identifiers
    final PageController _pageController = PageController(initialPage: 0);

    return SafeArea(
        child: Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.all(width / 30),
              child: ListView(children: [
                ItemViewComponents(
                  text: " ",
                  category: data["data"]["category"],
                ),
                // SizedBox(
                //   height: getProportionateScreenHeight(),
                // ),
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
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                SizedBox(
                  width: width,
                  child: Text(
                    data["data"]["commonname"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Text(
                    data["data"]["sciname"].isNotEmpty
                        ? data["data"]["sciname"]
                        : '',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(11),
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: width,
                  child: const Text(
                    "Description",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  constraints: BoxConstraints(
                    minWidth: width,
                    maxWidth: width,
                    minHeight: 170,
                    maxHeight: 270,
                  ),
                  child: LimitedBox(
                    maxHeight: 4 * 20.0, // assuming font size is 20
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data["data"]["description"],
                        style: const TextStyle(fontSize: 18),
                      ),
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
                      "Rs." + data["data"]["price"].toString(),
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.left,
                    ),
                    const Spacer(),
                    
                    CustomStepper(
                        lowerLimit: 1,
                        upperLimit: int.parse(data["data"]["quantity"]),
                        stepValue: 1,
                        iconSize: 22,
                        value: counter,
                        onChanged: (value) {
                          counter = value["qty"];
                        })
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // Expanded(
                //   flex: 3,
                //   child: Container(
                //     alignment: Alignment.center,
                //     child: Column(
                //       children: [
                //         Expanded(
                //           child: TextButton(
                //             style: greenButtonStyle,
                //             onPressed: () {
                //               openDialog();
                //             },
                //             child: const Text(
                //               "Buy Now",
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 16.0,
                //                 fontFamily: 'Poppings',
                //               ),
                //             ),
                //           ),
                //         ),
                //         const SizedBox(height: 10),
                //         Expanded(
                //             child: TextButton(
                //           style: greenButtonBorderStyle,
                //           onPressed: () {},
                //           child: Text(
                //             "Add Basket",
                //             style: TextStyle(
                //               color: HexColor.fromHex('#4CD964'),
                //               fontSize: 16.0,
                //               fontFamily: 'Poppins',
                //             ),
                //           ),
                //         )),
                //         const SizedBox(height: 10),
                //         Expanded(
                //             child: TextButton(
                //           style: greenButtonBorderStyle,
                //           onPressed: () {},
                //           child: Text(
                //             "Chat",
                //             style: TextStyle(
                //               color: HexColor.fromHex('#4CD964'),
                //               fontSize: 16.0,
                //               fontFamily: 'Poppins',
                //             ),
                //           ),
                //         ))
                //       ],
                //     ),
                //   ),
                // ),

                TextButton(
                  style: greenButtonStyle,
                  //############################Save the view##########################################
                  onPressed: () {
                    //sendEmail();
                    openDialog();
                  },
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                TextButton(
                  style: greenButtonBorderStyle,
                  //############################Add Basket##########################################
                  onPressed: () {
                    final cartViewModel = ref.read(cartItemsProvider.notifier);
                    cartViewModel.addCartItem(
                        data["data"]["id"], counter, username);
                    toggleTextAndIcon();
                  },
                  child: showText
                      ? Text(
                          "Add Basket",
                          style: TextStyle(
                            color: HexColor.fromHex('#4CD964'),
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                          ),
                        )
                      : Icon(
                          Icons.check_circle,
                          color: HexColor.fromHex('#4CD964'),
                          size: 30,
                        ),
                ),

                const SizedBox(
                  height: 10,
                ),

                TextButton(
                  style: data["data"]["chatactivate"]
                      ? greenButtonBorderStyle
                      : greyButtonStyle,
                  //############################Chat#######################################
                  onPressed: data["data"]["chatactivate"] ? () {


                  } : null,
                  child: Text(
                    "Chat",
                    style: TextStyle(
                      color: data["data"]["chatactivate"]
                          ? HexColor.fromHex('#4CD964')
                          : Colors.grey,
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ]),
            ),
    ));
  }


  Future openDialog() => showDialog(
        builder: (context) => AlertDialog(
          title: const Text("Enter your location for delivery"),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
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
              onPressed: () {
                setState(() {
                  // registerBuyItem();
                  makePayment();
                });
                // streetController.clear();
                // cityController.clear();
                // postalCodeController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Next"),
            ),
          ],
        ),
        context: context,
      );

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent(
          (data["data"]["price"] * counter).toString(), 'USD');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+94'),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true,currencyCode: 'USD',merchantCountryCode: '+94'),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'manoj'))
          .then((value) {
            sendEmail();
            displayPaymentSheet();
      }
      );


    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        //print("success");in here you can handle anything after successfull payments
        registerBuyItem();
        //sendEmail();
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("payment Successfully"),
                        ],
                      ),
                    ],
                  ),
                ));
      }).onError((error, stackTrace) {
        // ignore: avoid_print
        print("error=>>>$error $stackTrace");
      });
    } on StripeException catch (e) {
      // ignore: avoid_print
      print(e);

      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("concelled"),
              ));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51MlHd3KwlHMvGTglr20L5y1pZ4gFuriGRzxf6al9G0LIHQzAQyRX06PcLp54SG2TcAGtzku5ac6azSHgeEZB5TkV002PvcFuq0',
          'Contert-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('payment Intent body->>>${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  calculateAmount(String amount) {
    final calculateAmount = (int.parse(amount)) * 100;
    return calculateAmount.toString();
  }

}
