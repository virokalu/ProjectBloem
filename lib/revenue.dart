import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_bloem/revenuecard.dart';
import 'package:project_bloem/revenuedatamodel.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class ForAdmin extends StatefulWidget {
  const ForAdmin({super.key});

  @override
  State<ForAdmin> createState() => _ForAdminState();
}

List<RevenueDataModel> data = [];


Future<void> fetchData() async {
    // setState(() {
    //   _isLoading = true;
    // });
    try{
      final response = await http.get(Uri.parse(getbuydata+"/a"));
    final List<dynamic> responseData = jsonDecode(response.body);
    data = responseData
        .map((json) => RevenueDataModel(
              street: json['street'],
              town: json['town'],
              postalCode: json['postalCode'],
              sellername: json['sellername'],
              buyername: json['buyername'],
              itemid: json['itemid'],
              itemprice: json['itemprice'],
              app_fee: json['app_fee'],
              seller_amount: json['seller_amount'],
              apps_Total_amount: json['apps_Total_amount'],
            ))
        .toList();
    }
    catch(e){
      // setState(() {
      //   _isLoading = true;
      // });
    }
    // setState(() {
    //     _isLoading = false;
    //   });
    //print(data);
    print(data);
  }
  
  

class _ForAdminState extends State<ForAdmin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Payments with details"),
          leading: IconButton(onPressed: () {Navigator.pushNamed(context, '/');}, icon: Icon(Icons.back_hand)),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.payment_outlined)),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  RevCard(sellername: "Hashan", amount: "200", skey: "###################################################", id: "3024"),
                  RevCard(sellername: "Janushan", amount: "2000", skey: "###################################################", id: "3543"),
                  RevCard(sellername: "Manoj", amount: "120", skey: "###################################################", id: "3369"),
                  RevCard(sellername: "Kavinda", amount: "500", skey: "###################################################", id: "3254"),
                  RevCard(sellername: "Asanka", amount: "280", skey: "###################################################", id: "2563"),
                  RevCard(sellername: "Viro", amount: "150", skey: "###################################################", id: "3254"),
                ],
              ),
            ),
            Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App total fee: 250.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Total transaction Amount: 100000.00'),
          ],
        ),
      ),
    ),
          ],
        ),
      ),
    );
  }
}