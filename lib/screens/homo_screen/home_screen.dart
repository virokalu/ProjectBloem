
import 'package:flutter/material.dart';

import '../../components/size.dart';
import 'home_components/home_components.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const IconRow(),
              SizedBox(height: getProportionateScreenHeight(5)),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text("Hello, What flowers do you want today?",
                    style: TextStyle(fontSize: 20),
                  ),
              )

            ],
          ),

        ),

      ),
    );
  }
}


