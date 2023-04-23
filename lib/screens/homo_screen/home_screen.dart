
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/components/product_cards.dart';
import 'package:project_bloem/models/item.dart';
import 'package:project_bloem/models/item_filter.dart';
import 'package:project_bloem/models/pagination.dart';
import 'package:project_bloem/provider.dart';

import '../../components/color_components.dart';
import '../../components/size.dart';
import 'home_components/home_components.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // List<Item> list = List<Item>.empty(growable: true);
    // list.add(Item(
    //   username: "virokalu",
    //   category: "Cut Flowers",
    //   commonname: "Rose",
    //   sciname: "Rose",
    //   price: 1000,
    //   description: "check the add Lisiting in system",
    //   cashondelivery: true,
    //   chatactivate: true,
    //   imgone: "https://firebasestorage.googleapis.com/v0/b/projectbloem-1e1c5.appspot.com/o/itemImg%2Fvirokalu%2Fvirokalu2023-04-12%2019%3A01%3A24.060280scaled_Screenshot_20230407-213102.png?alt=media&token=0d70b4f1-7ace-4365-a0ef-2b8e485ecf69",
    //   imgtwo: "https://firebasestorage.googleapis.com/v0/b/projectbloem-1e1c5.appspot.com/o/itemImg%2Fvirokalu%2Fvirokalu2023-04-10%2021%3A09%3A25.579419scaled_IMG_20230327_125549.jpg?alt=media&token=e5325b68-1d2c-4055-ab0f-4e3d9979146e",
    //   imgthree: "https://firebasestorage.googleapis.com/v0/b/projectbloem-1e1c5.appspot.com/o/itemImg%2Fvirokalu%2Fvirokalu2023-04-10%2021%3A09%3A32.358213scaled_Screenshot_20230407-213102.png?alt=media&token=45e03852-b2b4-417b-b048-3907395ff699",
    //
    // ));
   // Item model =
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
                  child: Text("Hello, What do you want today?",
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
              SizedBox(height: getProportionateScreenWidth(5)),
              //#####################################################card here##############################################
              _itemsList(ref),
            ],
          ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Column(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),

                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      "Categories Here",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(22),
                        color: Colors.black,
                      ),
                    ),
                    ],
                  ),
                  ),
                  SizedBox(height: getProportionateScreenWidth(5)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //#####################################card start Here##########################################


                        CategoryCardBox(
                          colorName: HexColor.fromHex('#FFFAEB'),
                          img: "images/cutFlowers.jpg",
                          text: "Cut Flowers",


                        ),
                        CategoryCardBox(
                            colorName: HexColor.fromHex('#FEF0F0'),
                          img: "images/foliage.jpg",
                          text: "Foliage Plants",
                        ),
                        CategoryCardBox(
                          colorName: HexColor.fromHex('#F1EFF6'),
                          img: "images/potPlants.jpg",
                          text: "Pot Plants",
                        ),
                        CategoryCardBox(
                          colorName: HexColor.fromHex('#F1EFF6'),
                          img: "images/lanscapingPlants.jpg",
                          text: "Landscaping Plants",
                        ),
                        CategoryCardBox(
                          colorName: HexColor.fromHex('#F1EFF6'),
                          img: "images/beddingPlants.jpg",
                          text: "Bedded Plants",
                        ),
                        CategoryCardBox(
                          colorName: HexColor.fromHex('#F1EFF6'),
                          img: "images/propagatoryPlant.jpg",
                          text: "Propagatory Plants",
                        ),
                        CategoryCardBox(
                          colorName: HexColor.fromHex('#F1EFF6'),
                          img: "images/other.jpg",
                          text: "Other",
                        ),

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
  Widget _itemsList(WidgetRef ref){
    final items = ref.watch(
      homeItemProvider(
        ItemFilterModel(
          paginationModel: PaginationModel(page: 1,pageSize: 10),
        ),
      ),
    );

    //print(items);

    return items.when(
        data: (list){
          return _buildItemList(list!);
        },
        error: (error,__){
          //print(error);
          return Center(child: Text(error.toString()));
        },
        loading: ()=> const Center(
            child: CircularProgressIndicator()
        )
    );
  }

  Widget _buildItemList(List<Item> items){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //#####################################card start here#####################################################
          ...List.generate(
            items.length,
                (index) {
                  var data = items[index];
                  return CardBox(model: data);
            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
        ],
      ),
    );
    //   Container(
    //   alignment: Alignment.centerLeft,
    //   child: ListView.builder(
    //       physics: const ClampingScrollPhysics(),
    //       scrollDirection: Axis.horizontal,
    //       itemCount: items.length,
    //       itemBuilder: (context,index){
    //         var data = items[index];
    //         return GestureDetector(
    //           onTap: (){
    //
    //           },
    //           child: CardBox(model: data),
    //         );
    //       }
    //   ),
    // );
  }
}