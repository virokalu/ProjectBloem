import 'package:flutter/material.dart';

import '../../../components/back_button_icon.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: width / 10, horizontal: height / 90),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              ButtonText(text: 'Policies', icon: Icons.policy),
              SizedBox(height: 20),
              Divider(
                height: 0.1,
                thickness: 10.0,
              ),
              Text('Write Policy.......................')
            ],
          ),
        ),
      ),
    );
  }
}
