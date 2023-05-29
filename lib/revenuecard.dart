import 'package:flutter/material.dart';


class RevCard extends StatelessWidget {
  const RevCard({required this.sellername,required this.amount,required this.appPee,required this.id});
  final String sellername;
  final String amount;
  final String appPee;
  final String id;

  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seller Name: $sellername',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Seller Amount: $amount'),
            SizedBox(height: 8.0),
            Text('app fee from this seller: $appPee'),
            SizedBox(height: 8.0),
            Text('Seller Stripe Id: $id'),
          ],
        ),
      ),
    );
  }
}