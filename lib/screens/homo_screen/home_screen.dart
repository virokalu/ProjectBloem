
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
              SizedBox(height: getProportionateScreenHeight(1)),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text("Hello, What flowers do you want today?",
                    style: TextStyle(fontSize: 20),
                  ),

              ),
              SizedBox(height: getProportionateScreenHeight(20)),

              const SearchBarFilter(),

              SizedBox(height: getProportionateScreenHeight(20)),


          Column(
            children: [
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                //################################################see more function###################################
                child: SectionTitle(title: "Recommended Listing", press: () {}),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    //#####################################card start Here##########################################





                    // ...List.generate(
                    //   demoProducts.length,
                    //       (index) {
                    //     if (demoProducts[index].isPopular)
                    //       return ProductCard(product: demoProducts[index]);
                    //
                    //     return SizedBox
                    //         .shrink(); // here by default width and height is 0
                    //   },
                    // ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
              )
            ],
          ),




            ],

          ),

        ),

      ),
    );
  }
}


