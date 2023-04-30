import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;



class PaymentSheet  {
  PaymentSheet({required this.amount,required this.context});
  final String amount;
  final BuildContext context;
  late Map<String,dynamic> paymentIntent; 

  Future<void> makePayment() async {
    try{
      paymentIntent = await createPaymentIntent(amount,'USD');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          // applePay: const PaymentSheetApplePay(merchantCountryCode: '+94'),
          // googlePay: const PaymentSheetGooglePay(testEnv: true,currencyCode: 'USD',merchantCountryCode: '+94'),
          style: ThemeMode.dark,
          merchantDisplayName: 'manoj')).then((value){
        });

        displayPaymentSheet();
    }
    catch(e){
      // ignore: avoid_print
      print(e);
    }
  }

  displayPaymentSheet() async {
    try{
      await Stripe.instance.presentPaymentSheet(
      ).then((value) {
        showDialog(
          context: context, 
          builder: (_) => const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle,color: Colors.green,),
                    Text("Payment Succeeded"),
                  ],
                ),
              ],
            ),
          )

        );
      }).onError((error, stackTrace) {
          // ignore: avoid_print
          print("error=>>>$error $stackTrace");
      } );
    } on StripeException catch(e) {
      // ignore: avoid_print
      print(e);

      showDialog(
        context: context, 
        builder: (_) => const AlertDialog(
          content: Text("Cancelled"),
        ));
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
    
  }

  createPaymentIntent(String amount,String currency) async {
    try{
      Map<String,dynamic> body = {
        'amount' : calculateAmount(amount),
        'currency' : currency,
        'payment_method_types[]' : 'Card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization' : 'Bearer sk_test_51MlHd3KwlHMvGTglr20L5y1pZ4gFuriGRzxf6al9G0LIHQzAQyRX06PcLp54SG2TcAGtzku5ac6azSHgeEZB5TkV002PvcFuq0',
          'Contert-Type' : 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('payment Intent body->>>${response.body.toString()}');
      return jsonDecode(response.body);
    }
    catch(e){
      // ignore: avoid_print
      print(e);
    }
  }

  calculateAmount(String amount) {
    final calculateAmount = (int.parse(amount))*100 ;
    return calculateAmount.toString();
  }
}