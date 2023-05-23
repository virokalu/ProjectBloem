import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';
import 'package:project_bloem/components/product_cards.dart';
import 'package:project_bloem/screens/user_profile/iconwith_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/size.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';
import '../../models/item.dart';


class SellingPage extends StatefulWidget {

   const SellingPage({super.key});

  @override
  State<SellingPage> createState() => _SellingPageState();
}
class _SellingPageState extends State<SellingPage> {
  bool _isLoading=true;
  List<Item> activeItems = [];
  late SharedPreferences preference;
  String username = "";

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    preference = await SharedPreferences.getInstance();
    String? username = preference.getString('username');
    setState(() => this.username = username!);
    _fetchNews();


  }

  Future<void> _fetchNews() async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'username': username,
      'pageSize': "true"
    };
    var url = Uri.http(apiURL, itemGet, queryString);
    //print(url.toString());
    var response = await http.get(url, headers: requestHeader);

    // print(response.body);
    // if (response.statusCode == 200) {
    //   List<dynamic> activeItemList = jsonDecode(response.body)['data'];
    //   //print('news?: $newsList');
    //   List<Map<String, String>> newActiveItems =[];
    //   for (var activeItemMap in activeItemList) {
    //     Map<String, String> newsItem = {
    //       'id': activeItemMap['id'],
    //       'commonname': activeItemMap['commonname'],
    //       'imgone': activeItemMap['imgone'],
    //       //'date': activeItemMap['date'],
    //     };
    //     newActiveItems.add(newsItem);
    //   }
    //   setState(() {
    //     activeItems = newActiveItems;
    //     //_isLoading = false;
    //   });
    //
    // } else {
    //   print("Error");
    //   // if (kDebugMode) {
    //   //   print('Failed to fetch news: ${response.statusCode}');
    //   // }
    // }

    var data = jsonDecode(response.body);
    //print(data);
    if (data["status"]) {
      //print(data["data"]);
      activeItems.addAll(itemsFromJson(data["data"]));
      setState(() => _isLoading = false);
      //print(activeItems.toString());
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(width / 30),
          child: ListView(
            children: [
              const ButtonText(text: "Sell", icon: Icons.list),
              const Text(
                "To Delivery",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SellingCard(),
                    const SellingCard(),
                    const SellingCard(),
                    const SellingCard(),

                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Active",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [

                      Icon(Icons.edit, size: getProportionateScreenHeight(18),),
                    ],
                  ),
                ],
              ),

              //const Divider(color: Color.fromARGB(255, 243, 236, 236)),
              const SizedBox(height: 10,),
              _buildItemList(activeItems),
              //SizedBox(height: 10,),
              Column(

                children: [
                  const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     //Icon(Icons.add),
                  //     IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                  //     const Text(
                  //       "Create Listing",
                  //       style: TextStyle(
                  //         fontFamily: 'Poppins',
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ClickableBar(
                    icon: Icons.add,
                    name: 'Create Listing',
                    onPressed: () {
                      Navigator.pushNamed(context, '/addListing');
                    },
                  ),
                  //IconWithText(icon: Icons.chat, text: "Chat", address: "address"),

                  const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     IconButton(onPressed: (){}, icon: const Icon(Icons.summarize_outlined)),
                  //     const Text(
                  //       "Summary",
                  //       style: TextStyle(
                  //         fontFamily: 'Poppins',
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ClickableBar(
                    icon: Icons.summarize_outlined,
                    name: 'Summary',
                    onPressed: () {
                      Navigator.pushNamed(context, '/summery');
                    },
                  ),
                  const Divider(color: Color.fromARGB(255, 243, 236, 236)),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     IconButton(onPressed: (){}, icon: const Icon(Icons.delivery_dining_sharp)),
                  //     const Text(
                  //       "Delivery",
                  //       style: TextStyle(
                  //         fontFamily: 'Poppins',
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ClickableBar(
                    icon: Icons.delivery_dining_sharp,
                    name: 'Delivery',
                    onPressed: () {
                      Navigator.pushNamed(context, '/delivery');
                    },
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildItemList(List<Item> items) {
    if(_isLoading){
      return const Center(child: LinearProgressIndicator());
    }else{
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            //#####################################card start here#####################################################
            if (items.isEmpty)
              const Center(child: Text('Create Listing to Display......')),
            ...List.generate(
              items.length,
                  (index) {
                var data = items[index];
                return SizedBox(
                  height: 170,
                  child: ActiveCard(model: data),
                );
              },
            ),
            SizedBox(width: getProportionateScreenWidth(20)),


          ],
        ),
      );
    }
  }
}


// class SellingPage extends ConsumerWidget {
//   final String? username;
//
//   const SellingPage({super.key,this.username});
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//
//
//
//     var width = MediaQuery.of(context).size.width;
//     SizeConfig().init(context);
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           margin: EdgeInsets.all(width / 30),
//           child: ListView(
//             children: [
//               const ButtonText(text: "Sell", icon: Icons.list),
//               const Text(
//                 "To Delivery",
//                 style: TextStyle(
//                   fontFamily: "Poppins",
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const Divider(color: Color.fromARGB(255, 243, 236, 236)),
//               SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         const SellingCard(),
//                         const SellingCard(),
//                         const SellingCard(),
//                         const SellingCard(),
//
//                         SizedBox(width: getProportionateScreenWidth(20)),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Active",
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Row(
//                         children: [
//
//                           Icon(Icons.edit,size: getProportionateScreenHeight(18),),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   //const Divider(color: Color.fromARGB(255, 243, 236, 236)),
//               const SizedBox(height: 10,),
//
//               _itemsList(ref),
//                   //SizedBox(height: 10,),
//                   Column(
//
//                     children: [
//                       const Divider(color: Color.fromARGB(255, 243, 236, 236)),
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       //   children: [
//                       //     //Icon(Icons.add),
//                       //     IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
//                       //     const Text(
//                       //       "Create Listing",
//                       //       style: TextStyle(
//                       //         fontFamily: 'Poppins',
//                       //         fontWeight: FontWeight.bold,
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       ClickableBar(
//                         icon: Icons.add,
//                         name: 'Create Listing',
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/addListing');
//                         },
//                       ),
//                       //IconWithText(icon: Icons.chat, text: "Chat", address: "address"),
//
//                       const Divider(color: Color.fromARGB(255, 243, 236, 236)),
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       //   children: [
//                       //     IconButton(onPressed: (){}, icon: const Icon(Icons.summarize_outlined)),
//                       //     const Text(
//                       //       "Summary",
//                       //       style: TextStyle(
//                       //         fontFamily: 'Poppins',
//                       //         fontWeight: FontWeight.bold,
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       ClickableBar(
//                         icon: Icons.summarize_outlined,
//                         name: 'Summary',
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/summery');
//                         },
//                       ),
//                       const Divider(color: Color.fromARGB(255, 243, 236, 236)),
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       //   children: [
//                       //     IconButton(onPressed: (){}, icon: const Icon(Icons.delivery_dining_sharp)),
//                       //     const Text(
//                       //       "Delivery",
//                       //       style: TextStyle(
//                       //         fontFamily: 'Poppins',
//                       //         fontWeight: FontWeight.bold,
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       ClickableBar(
//                         icon: Icons.delivery_dining_sharp,
//                         name: 'Delivery',
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/delivery');
//                         },
//                       ),
//
//                     ],
//                   ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _itemsList(WidgetRef ref){
//     final items = ref.watch(
//       homeItemProvider(
//         ItemFilterModel(
//           paginationModel: PaginationModel(page: 1,pageSize: 10),
//           username:username,
//           activestatus: "true",
//         ),
//       ),
//     );
//
//     //print(items);
//
//     return items.when(
//         data: (list){
//           return _buildItemList(list!);
//         },
//         error: (error,__){
//           //print(error);
//           return Center(child: Text(error.toString()));
//         },
//         loading: ()=> const Center(
//             child: CircularProgressIndicator()
//         )
//     );
//   }
//
//   Widget _buildItemList(List<Item> items){
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           //#####################################card start here#####################################################
//           if (items.isEmpty)
//             const Text('No items to display'),
//
//           ...List.generate(
//             items.length,
//                 (index) {
//               var data = items[index];
//               return SizedBox(
//                 height: 170,
//                 child: ActiveCard(model: data),
//               );
//
//             },
//           ),
//           SizedBox(width: getProportionateScreenWidth(20)),
//
//         ],
//       ),
//     );
//     //   Container(
//     //   alignment: Alignment.centerLeft,
//     //   child: ListView.builder(
//     //       physics: const ClampingScrollPhysics(),
//     //       scrollDirection: Axis.horizontal,
//     //       itemCount: items.length,
//     //       itemBuilder: (context,index){
//     //         var data = items[index];
//     //         return GestureDetector(
//     //           onTap: (){
//     //
//     //           },
//     //           child: CardBox(model: data),
//     //         );
//     //       }
//     //   ),
//     // );
//   }
