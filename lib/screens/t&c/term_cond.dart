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
              'Welcome to our m-commerce app. By accessing and using this app, you agree to be bound by the following terms and conditions. Please read them carefully',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              '1. User Responsibilities:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '- You are responsible for providing accurate and complete registration information.',
            ),
            Text(
              '- You must use your personal account in a lawful manner and comply with all applicable laws and regulations.',
            ),
            Text(
              '- Unauthorized access to or tampering with the app is strictly prohibited.',
            ),
            SizedBox(height: 16.0),
            Text(
              '2. Account Creation and Security:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '- You are solely responsible for creating a strong password and safeguarding your login credentials.',
            ),
            Text(
              '- Notify us immediately of any unauthorized access or suspicious activity related to your account.',
            ),
            SizedBox(height: 16.0),
            Text(
              '3. Intellectual Property Rights:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '- All intellectual property rights within the app, including trademarks, copyrights, and patents, belong to us.',
            ),
            Text(
              '- You may not use, reproduce, or distribute any app content without our explicit permission.',
            ),
            SizedBox(height: 16.0),
            Text(
              '4. Payment and Billing:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '- We offer various payment methods, such as credit cards, cash on delivery',
            ),
            Text(
              '- Payments will be processed according to the selected method and any applicable fees.',
            ),
            SizedBox(height: 16.0),
            Text(
              '5. Transaction Fees:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '- For the first \$5000 received by the seller, no transaction fees will be charged.',
            ),
            Text(
              '- For any amount received by the seller above \$5000, a 5% transaction fee will be deducted.',
            ),
            SizedBox(height: 16.0),
            Text(
              '6. Product Listings and Descriptions:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '- Our app may include product listings or descriptions provided by sellers or third parties.',
            ),
            Text(
              '- We do not guarantee the accuracy, quality, or legality of the products or services offered by sellers.',
            ),
            SizedBox(height: 16.0),
            Text(
              '7. Product Delivery:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '- We provide the information of delivery companies for your convenience.',
            ),
            Text(
              '- We do not take any responsibility for the delivery of products.',
            ),
            Text(
              '- Use of these delivery services is at your own risk.',
            ),
            SizedBox(height: 16.0),
            Text(
              '8. Termination of Account:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '- We reserve the right to terminate or suspend your account in case of violation of the terms or illegal activities.',
            ),
            Text(
              '- Termination may result in the loss of access to the app and any associated data.',
            ),
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
                      'I have read and agree to the terms and conditions.'))
            ]),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: MaterialButton(
                onPressed: isChecked ? printMsg : null,
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
