import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';
import 'package:project_bloem/components/color_components.dart';

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({super.key});

  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  bool isChecked = false;

  void printMsg() {
    print('user accepted the agreement');
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: EdgeInsets.all(width / 30),
        padding: EdgeInsets.all(width / 30),
        child: ListView(
          children: [
            ButtonText(text: "Terms and Conditions", icon: Icons.description),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Welcome to our bloem app. By accessing and using this app, you agree to be bound by the following terms and conditions. Please read them carefully',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              '1. User Responsibilities:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
              '- You are responsible for providing accurate and complete registration information.',
              style: TextStyle(fontSize: 12),
            ),
            Text(
                '- You must use your personal account in a lawful manner and comply with all applicable laws and regulations.',
                style: TextStyle(fontSize: 12)),
            Text(
                '- Unauthorized access to or tampering with the app is strictly prohibited.',
                style: TextStyle(fontSize: 12)),
            SizedBox(height: 16.0),
            Text(
              '2. Account Creation and Security:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
                '- You are solely responsible for creating a strong password and safeguarding your login credentials.',
                style: TextStyle(fontSize: 12)),
            Text(
                '- Notify us immediately of any unauthorized access or suspicious activity related to your account.',
                style: TextStyle(fontSize: 12)),
            SizedBox(height: 16.0),
            Text(
              '3. Intellectual Property Rights:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
                '- All intellectual property rights within the app, including trademarks, copyrights, and patents, belong to us.',
                style: TextStyle(fontSize: 12)),
            Text(
                '- You may not use, reproduce, or distribute any app content without our explicit permission.',
                style: TextStyle(fontSize: 12)),
            SizedBox(height: 16.0),
            Text(
              '4. Payment and Billing:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
                '- We offer various payment methods, such as credit cards, cash on delivery',
                style: TextStyle(fontSize: 12)),
            Text(
                '- Payments will be processed according to the selected method and any applicable fees.',
                style: TextStyle(fontSize: 12)),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(width / 50),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5. Transaction Fees:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(
                      '- For the first \$5000 received by the seller, no transaction fees will be charged.',
                      style: TextStyle(fontSize: 12)),
                  Text(
                      '- For any amount received by the seller above \$5000, a 5% transaction fee will be deducted.',
                      style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '6. Product Listings and Descriptions:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
                '- Our app may include product listings or descriptions provided by sellers or third parties.',
                style: TextStyle(fontSize: 12)),
            Text(
                '- We do not guarantee the accuracy, quality, or legality of the products or services offered by sellers.',
                style: TextStyle(fontSize: 12)),
            SizedBox(height: 16.0),
            Text(
              '7. Product Delivery:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
                '- We provide the information of delivery companies for your convenience.',
                style: TextStyle(fontSize: 12)),
            Text(
                '- We do not take any responsibility for the delivery of products.',
                style: TextStyle(fontSize: 12)),
            Text('- Use of these delivery services is at your own risk.',
                style: TextStyle(fontSize: 12)),
            SizedBox(height: 16.0),
            Text(
              '8. Termination of Account:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                '- We reserve the right to terminate or suspend your account in case of violation of the terms or illegal activities.',
                style: TextStyle(fontSize: 12)),
            Text(
                '- Termination may result in the loss of access to the app and any associated data.',
                style: TextStyle(fontSize: 12)),
            SizedBox(height: 16.0),
            Row(children: [
              Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  }),
              Expanded(
                  child: Text(
                      'I have read and agree to the terms and conditions.',
                      style: TextStyle(fontSize: 12)))
            ]),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: MaterialButton(
                onPressed: () {
                    isChecked ? printMsg : null;
                    Navigator.pushNamed(context, '/sellerreg');
                },
                child: Text('Agree'),
                height: 60,
                minWidth: 350,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                color: HexColor.fromHex('#4CD964'),
              ),
            )
          ],
        ),
      )),
    );
  }
}
