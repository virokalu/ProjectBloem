

// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/components/size.dart';
import 'package:project_bloem/models/item.dart';
import 'package:project_bloem/models/item_filter.dart';
import 'package:project_bloem/models/pagination.dart';
import 'package:project_bloem/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/item_view/item_view_new.dart';
import 'color_components.dart';


class CardBox extends ConsumerStatefulWidget {
  final Item model;

  const CardBox({super.key, required this.model});

  @override
  _CardBoxState createState() => _CardBoxState();
}

class _CardBoxState extends ConsumerState<CardBox> {

  late SharedPreferences preference;
  String? username;
  String? token;

  @override
  void initState(){
    super.initState();
    init();
  }
  Future init() async{
    preference = await SharedPreferences.getInstance();
    String? token=preference.getString('token');
    String? username=preference.getString('username');
    //print(token);

    setState(() =>this.token=token!);
    setState(() =>this.username=username!);
    //setState(() =>this.fullname=fullname!);

  }
  bool showText = true;
  bool showWish = true;

  void toggleTextAndIcon() {
    setState(() {
      showText = !showText;
    });

    Timer(const Duration(seconds: 1), () {
      setState(() {
        showText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,bottom: 5),
      child: SizedBox(
        width: 190,
        height: 250,
        child: GestureDetector(
          onTap: (){
            //print(model!.id);
            //Navigator.pushNamed(context, '/itemview');
            Navigator.push(context, MaterialPageRoute(builder: (context) => ItemViewNew(id : widget.model.id.toString())));
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
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 50),
                          IconButton(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            onPressed: () {
                              setState(() {
                                if(token==null){
                                  //print(token);
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(context, '/login');
                                }else{
                                  showWish = false;
                                }

                              });
                            },
                            //######################################need to change with the click###################
                            icon: showWish? const Icon(Icons.favorite_border) : const Icon(Icons.favorite),
                            color: HexColor.fromHex('#4CD964'),
                          ),

                        ],
                      ),

                      ClipRRect(

                        borderRadius: BorderRadius.circular(10), // Image border
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48),
                          //###############################################image here###################// Image radius
                          child: Image.network(widget.model.imgone, fit: BoxFit.cover),
                        ),
                      ),

                      const SizedBox(height: 10),
                      SizedBox(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
//####################################################titlt here################################################
                            widget.model.commonname,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,

                            ),
                            maxLines: 1,

                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            //##########################################price here################################
                            'Rs.${widget.model.price}',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: HexColor.fromHex('#4CD964'),
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(0),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: HexColor.fromHex('#E7FFED'),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                onPressed: () {

                                  if(token==null){
                                    //print(token);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushNamed(context, '/login');
                                  }else{
                                    final cartViewModel = ref.read(cartItemsProvider.notifier);
                                    cartViewModel.addCartItem(widget.model.id, 1, username);
                                    toggleTextAndIcon();
                                  }

                                },
                                //###################################################go to item when click##########
                                icon: showText? const Icon(Icons.shopping_cart)
                                    : const Icon(
                                    Icons.done,
                                  size: 30,
                                ),
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


// class CardBox extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
//
// }


class CategoryCardBox extends ConsumerWidget {

  final String img;
  final String text;
  final Color colorName;
  //final VoidCallback onPressed;
  const CategoryCardBox({super.key,required this.colorName,required this.img,required this.text});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
      return Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
        child: SizedBox(
          width: getProportionateScreenWidth(150),
          child: GestureDetector(
            onTap: (){
              ItemFilterModel filterModel = ItemFilterModel(
                paginationModel: PaginationModel(
                    pageSize:  10,
                    page: 1),
                category: text,
              );

              ref
                  .read(itemsFilterProvider.notifier)
                  .setItemFilter(filterModel);
              ref.read(itemNotifierProvider.notifier).getItems();

              //print(ref);
              Navigator.of(context).pushNamed(
                  '/category',
                  arguments: {
                    'category':text,
                  }

              );
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
                            size: Size.fromRadius(getProportionateScreenHeight(48)),
                            //###############################################image here###################// Image radius
                            child: Image.asset(img, fit: BoxFit.cover),
                          ),
                        ),

                        const SizedBox(height: 10),
                        SizedBox(
                          height: 20,
                          child: Text(
//####################################################titlt here################################################
                            text,
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
                        size: Size.fromRadius(getProportionateScreenHeight(48)),
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

class ActiveCard extends StatelessWidget {
  final Item? model;
  const ActiveCard({Key? key,this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
      child: SizedBox(
        width: getProportionateScreenWidth(110),
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
                aspectRatio: 0.65,
                child: Container(
                  margin: const EdgeInsets.only(left:5,right:5,top:0),
                  padding: const EdgeInsets.only(left: 0,right: 0),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: getProportionateScreenWidth(40)),
                          IconButton(
                            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                            onPressed: () { },
                            //######################################need to change with the click###################
                            icon: Icon(Icons.circle,size: getProportionateScreenWidth(10),),
                            color: HexColor.fromHex('#4CD964'),
                          ),

                        ],
                      ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Image border
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(getProportionateScreenHeight(40)),
                          //###############################################image here###################// Image radius
                          child: Image.network(model!.imgone, fit: BoxFit.cover),
                        ),
                      ),

                      const SizedBox(height: 10),
                      SizedBox(
                        height: getProportionateScreenWidth(15),
                        child: Text(
//####################################################titlt here################################################
                          model!.commonname,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(12),
                            fontWeight: FontWeight.bold,

                          ),
                          maxLines: 1,

                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       //##########################################price here################################
                      //       "To Hambantota",
                      //       style: TextStyle(
                      //         fontSize: getProportionateScreenWidth(16),
                      //         fontWeight: FontWeight.w400,
                      //         color: HexColor.fromHex('#4CD964'),
                      //       ),
                      //     ),
                      //     // InkWell(
                      //     //   borderRadius: BorderRadius.circular(50),
                      //     //   onTap: () {},
                      //     //   child: Container(
                      //     //     padding: EdgeInsets.all(getProportionateScreenWidth(0)),
                      //     //     height: getProportionateScreenWidth(40),
                      //     //     width: getProportionateScreenWidth(40),
                      //     //     decoration: BoxDecoration(
                      //     //       color: HexColor.fromHex('#E7FFED'),
                      //     //       shape: BoxShape.circle,
                      //     //     ),
                      //     //     child: IconButton(
                      //     //       padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      //     //       onPressed: () { },
                      //     //       //###################################################go to item when click##########
                      //     //       icon: const Icon(Icons.shopping_cart),
                      //     //       color: HexColor.fromHex('#4CD964'),
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //   ],
                      // )
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

class ItemCard extends StatelessWidget {
  final Item? model;
  const ItemCard({Key? key,this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: const BoxDecoration(color:Colors.white),
      margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        children: [
          SizedBox(
            height: 100,
              width: MediaQuery.of(context).size.width,
            child: Image.network(
              model!.imgone,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,left:10),
            child: Text(
              model!.commonname,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight:FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Row(
                  children: [
                    Text(
                        "Rs.${model!.price}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: null,
                      ),
                    ),
                  ],
                ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.favorite,
                    color: HexColor.fromHex('#4CD964'),
                    size: 20,
                  ),
                  onTap: (){

                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

