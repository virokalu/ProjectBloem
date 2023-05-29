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
int Totalfee=0;
int appvalue=0;
int Totaltransaction=0;


Future<void> fetchData() async {
    try{
      final response = await http.get(Uri.parse(getbuydata));
      if(response.statusCode == 200){
        // print("ok");
        // print(response.body);
        // print("test");
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> buyItems = responseData['regbuyitems'];
        // print(buyItems);

    data = buyItems
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
              stid : json['stid']
            ))
        .toList();
      }

      print(data[0].street);
    
    }
    catch(e){
      // setState(() {
      //   _isLoading = true;
      // });
      print(e);
    }
    // setState(() {
    //     _isLoading = false;
    //   });
    //print(data);
    //print(data[1]);
  }

class _ForAdminState extends State<ForAdmin> {

  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Payments with details"),
          leading: IconButton(onPressed: () {Navigator.pushNamed(context, '/');}, icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(onPressed: () {
              setState(() {
                fetchData();
              });
            }, icon: const Icon(Icons.payment_outlined)),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  RevenueDataModel item = data[index];
                  appvalue += item.app_fee.toInt();
                  //appvalue = Totalfee;
                  //Totalfee = 0;

                  if(index == data.length -1){
                    Totaltransaction = item.apps_Total_amount;
                    return RevCard(
                      sellername: item.sellername,
                      amount: item.seller_amount.toString(),
                      appPee: item.app_fee.toString(),
                      id: item.stid,
                    );
                  }else{
                    return RevCard(
                      sellername: item.sellername,
                      amount: item.seller_amount.toString(),
                      appPee: item.app_fee.toString(),
                      id: item.stid,
                    );
                  }

                },
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
              "Bloem total app fee: "+appvalue.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text("Total transaction Amount: "+Totaltransaction.toString()),
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