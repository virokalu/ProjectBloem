

import 'package:flutter/material.dart';
import 'package:project_bloem/components/size.dart';

import 'color_components.dart';


class CardBox extends StatelessWidget {
  const CardBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
      child: SizedBox(
        width: getProportionateScreenWidth(170),
        child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/itemview');
          },
          //######################################on tap navigation############################
          // onTap: () => Navigator.pushNamed(
          //   context,
          //   DetailsScreen.routeName,
          //   arguments: ProductDetailsArguments(product: product),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            AspectRatio(
            aspectRatio: 0.75,
              child: Container(
                margin: const EdgeInsets.only(left:5,right:5,top:10),
                padding: const EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 40,
                      offset: const Offset(0, 25), // changes position of shadow
                    ),
                  ],

                ),
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: getProportionateScreenWidth(40)),
                        IconButton(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          onPressed: () { },
                          //######################################need to change with the click###################
                          icon: const Icon(Icons.favorite_border),
                          color: HexColor.fromHex('#4CD964'),
                        ),

                      ],
                    ),

                    ClipRRect(

                      borderRadius: BorderRadius.circular(10), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48),
                        //###############################################image here###################// Image radius
                        child: Image.asset("images/welcome.png", fit: BoxFit.cover),
                      ),
                    ),

                    const SizedBox(height: 10),
                    SizedBox(
                      height: 20,
                      child: Text(
//####################################################titlt here################################################
                      "Sun Flower",
                      style: TextStyle(
                          color: Colors.black,
                        fontSize: getProportionateScreenWidth(16),
                        fontWeight: FontWeight.bold,

                      ),
                      maxLines: 1,

                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          //##########################################price here################################
                          "Rs.5000",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.w400,
                            color: HexColor.fromHex('#4CD964'),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(getProportionateScreenWidth(0)),
                            height: getProportionateScreenWidth(40),
                            width: getProportionateScreenWidth(40),
                            decoration: BoxDecoration(
                              color: HexColor.fromHex('#E7FFED'),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              onPressed: () { },
                              //###################################################go to item when click##########
                              icon: const Icon(Icons.shopping_cart),
                              color: HexColor.fromHex('#4CD964'),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

              ),
            ),



            ],
          ),
        ),
      ),
    );
  }

}


class CategoryCardBox extends StatelessWidget {


  final Color colorName;
  const CategoryCardBox({super.key,required this.colorName});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
      child: SizedBox(
        width: getProportionateScreenWidth(150),
        child: GestureDetector(
          onTap: (){},
          //######################################on tap navigation############################
          // onTap: () => Navigator.pushNamed(
          //   context,
          //   DetailsScreen.routeName,
          //   arguments: ProductDetailsArguments(product: product),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: Container(
                  margin: const EdgeInsets.only(left:5,right:5,top:10),
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorName,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 40,
                        offset: const Offset(0, 25), // changes position of shadow
                      ),
                    ],

                  ),
                  child: Column(

                    children: [
                      const SizedBox(height: 20),
                      ClipRRect(

                        borderRadius: BorderRadius.circular(10), // Image border
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48),
                          //###############################################image here###################// Image radius
                          child: Image.asset("images/welcome.png", fit: BoxFit.cover),
                        ),
                      ),

                      const SizedBox(height: 10),
                      SizedBox(
                        height: 20,
                        child: Text(
//####################################################titlt here################################################
                          "Sun Flower",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(16),


                          ),
                          maxLines: 1,

                        ),
                      ),

                    ],
                  ),

                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

//##################################selling Card#################

class SellingCard extends StatelessWidget {
  const SellingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
      child: SizedBox(
        width: getProportionateScreenWidth(150),
        child: GestureDetector(
          onTap: (){},
          //######################################on tap navigation############################
          // onTap: () => Navigator.pushNamed(
          //   context,
          //   DetailsScreen.routeName,
          //   arguments: ProductDetailsArguments(product: product),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            AspectRatio(
            aspectRatio: 0.75,
              child: Container(
                margin: const EdgeInsets.only(left:5,right:5,top:10),
                padding: const EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 40,
                      offset: const Offset(0, 25), // changes position of shadow
                    ),
                  ],

                ),
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: getProportionateScreenWidth(40)),
                        IconButton(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          onPressed: () { },
                          //######################################need to change with the click###################
                          icon: const Icon(Icons.circle),
                          color: HexColor.fromHex('#4CD964'),
                        ),

                      ],
                    ),

                    ClipRRect(

                      borderRadius: BorderRadius.circular(10), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48),
                        //###############################################image here###################// Image radius
                        child: Image.asset("images/welcome.png", fit: BoxFit.cover),
                      ),
                    ),

                    const SizedBox(height: 10),
                    SizedBox(
                      height: 20,
                      child: Text(
//####################################################titlt here################################################
                      "Sun Flower",
                      style: TextStyle(
                          color: Colors.black,
                        fontSize: getProportionateScreenWidth(16),
                        fontWeight: FontWeight.bold,

                      ),
                      maxLines: 1,

                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          //##########################################price here################################
                          "To Hambantota",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.w400,
                            color: HexColor.fromHex('#4CD964'),
                          ),
                        ),
                        // InkWell(
                        //   borderRadius: BorderRadius.circular(50),
                        //   onTap: () {},
                        //   child: Container(
                        //     padding: EdgeInsets.all(getProportionateScreenWidth(0)),
                        //     height: getProportionateScreenWidth(40),
                        //     width: getProportionateScreenWidth(40),
                        //     decoration: BoxDecoration(
                        //       color: HexColor.fromHex('#E7FFED'),
                        //       shape: BoxShape.circle,
                        //     ),
                        //     child: IconButton(
                        //       padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        //       onPressed: () { },
                        //       //###################################################go to item when click##########
                        //       icon: const Icon(Icons.shopping_cart),
                        //       color: HexColor.fromHex('#4CD964'),
                        //     ),
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),

              ),
            ),



            ],
          ),
        ),
      ),
    );
  }

}