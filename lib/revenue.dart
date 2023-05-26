// class payments{
//   late double total;
//   late double itemprice;
//   late double sellerprofit;
//   late double appsfee;
//   late double totalappfee;
//   payments(double total,double itemprice) {
//       this.total = total;
//       this.itemprice = itemprice;
//   }
//   void main() {
//     if(total >= 5000){
//         sellerprofit = itemprice*(95/100);
//         appsfee = itemprice*(5/100);
//     }else{
//       sellerprofit = itemprice;
//       appsfee = 0;
//     }
//     totalappfee += appsfee;
//     total += itemprice;
//   }
// }

import 'package:flutter/material.dart';
import 'package:project_bloem/revenuecard.dart';

class ForAdmin extends StatefulWidget {
  const ForAdmin({super.key});

  @override
  State<ForAdmin> createState() => _ForAdminState();
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