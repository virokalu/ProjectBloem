import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/models/item_sort.dart';
//import 'package:project_bloem/components/color_components.dart';
import '../../components/back_button_icon.dart';
import '../../components/size.dart';
import '../homo_screen/home_components/home_components.dart';

class SearchResultScreen extends StatefulWidget{
  const SearchResultScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchResultScreenState createState() => _SearchResultScreenState();

}

class _SearchResultScreenState extends State<SearchResultScreen>{
  String? category;

  List<bool> expanded = [false, false];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width/30),
          child: ListView(
              children: [
                const BackButtonNHome(),
                SizedBox(height: getProportionateScreenHeight(20)),

                const SearchBar(),
                // SizedBox(
                //   height: height * 0.75,
                //   child: SingleChildScrollView(
                //     child: Column(
                //       children: [
                //         TextField(
                //           decoration: InputDecoration(
                //             contentPadding: EdgeInsets.symmetric(
                //                 horizontal: getProportionateScreenWidth(30),
                //                 vertical: getProportionateScreenWidth(20)),
                //             border: InputBorder.none,
                //             focusedBorder: InputBorder.none,
                //             enabledBorder:  OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   color: HexColor.fromHex('#86869E')
                //               ),
                //               borderRadius: BorderRadius.circular(20.0),
                //             ),
                //             hintText: "Sunflower",
                //             hintStyle: TextStyle(color: HexColor.fromHex('#86869E')),
                //             prefixIcon: Icon(
                //                 Icons.search,
                //                 color: HexColor.fromHex('#86869E')
                //             ),
                //             suffixIcon: Icon(
                //                 Icons.close,
                //                 color: HexColor.fromHex('#86869E')
                //             )
                //           ),
                //         ),
                //
                //         SafeArea(
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 const CircleAvatar(
                //                   radius: 40,
                //                   backgroundImage: AssetImage('images/background1.jpg'),
                //                 ),
                //                 SizedBox(
                //                     height: height /5,
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //
                //                       children: [
                //                         const Text(
                //                           "Sunflower",
                //                           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                //                         ),
                //                         const Text(
                //                           "Rs. 500",
                //                           style: TextStyle(fontSize: 16.0),
                //                         ),
                //                         Row(
                //                           children: [
                //                             IconButton(
                //                               onPressed: () { },
                //                               //alignment: AlignmentDirectional.bottomCenter,
                //                               icon: const Icon(Icons.favorite_border),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                             IconButton(
                //                               onPressed: () { },
                //                               icon: const Icon(Icons.shopping_basket),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     ),
                //                 ),
                //               ],
                //             )
                //         ),
                //         const Divider(height: 0.1,),
                //         SafeArea(
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 const CircleAvatar(
                //                   radius: 40,
                //                   backgroundImage: AssetImage('images/background1.jpg'),
                //                 ),
                //                 SizedBox(
                //                     height: height /5,
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //
                //                       children: [
                //                         const Text(
                //                           "Sunflower",
                //                           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                //                         ),
                //                         const Text(
                //                           "Rs. 500",
                //                           style: TextStyle(fontSize: 16.0),
                //                         ),
                //                         Row(
                //                           children: [
                //                             IconButton(
                //                               onPressed: () { },
                //                               //alignment: AlignmentDirectional.bottomCenter,
                //                               icon: const Icon(Icons.favorite_border),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                             IconButton(
                //                               onPressed: () { },
                //                               icon: const Icon(Icons.shopping_basket),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     )
                //                 ),
                //               ],
                //             )
                //         ),
                //         const Divider(height: 0.1,),
                //         SafeArea(
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 const CircleAvatar(
                //                   radius: 40,
                //                   backgroundImage: AssetImage('images/background1.jpg'),
                //                 ),
                //                 SizedBox(
                //                     height: height /5,
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //
                //                       children: [
                //                         const Text(
                //                           "Sunflower",
                //                           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                //                         ),
                //                         const Text(
                //                           "Rs. 500",
                //                           style: TextStyle(fontSize: 16.0),
                //                         ),
                //                         Row(
                //                           children: [
                //                             IconButton(
                //                               onPressed: () { },
                //                               //alignment: AlignmentDirectional.bottomCenter,
                //                               icon: const Icon(Icons.favorite_border),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                             IconButton(
                //                               onPressed: () { },
                //                               icon: const Icon(Icons.shopping_basket),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     )
                //                 ),
                //               ],
                //             )
                //         ),
                //         const Divider(height: 0.1,),
                //         SafeArea(
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 const CircleAvatar(
                //                   radius: 40,
                //                   backgroundImage: AssetImage('images/background1.jpg'),
                //                 ),
                //                 SizedBox(
                //                     height: height /5,
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //
                //                       children: [
                //                         const Text(
                //                           "Sunflower",
                //                           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                //                         ),
                //                         const Text(
                //                           "Rs. 500",
                //                           style: TextStyle(fontSize: 16.0),
                //                         ),
                //                         Row(
                //                           children: [
                //                             IconButton(
                //                               onPressed: () { },
                //                               //alignment: AlignmentDirectional.bottomCenter,
                //                               icon: const Icon(Icons.favorite_border),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                             IconButton(
                //                               onPressed: () { },
                //                               icon: const Icon(Icons.shopping_basket),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     )
                //                 ),
                //               ],
                //             )
                //         ),
                //         const Divider(height: 0.1,),
                //         SafeArea(
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 const CircleAvatar(
                //                   radius: 40,
                //                   backgroundImage: AssetImage('images/background1.jpg'),
                //                 ),
                //                 SizedBox(
                //                     height: height /5,
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //
                //                       children: [
                //                         const Text(
                //                           "Sunflower",
                //                           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                //                         ),
                //                         const Text(
                //                           "Rs. 500",
                //                           style: TextStyle(fontSize: 16.0),
                //                         ),
                //                         Row(
                //                           children: [
                //                             IconButton(
                //                               onPressed: () { },
                //                               //alignment: AlignmentDirectional.bottomCenter,
                //                               icon: const Icon(Icons.favorite_border),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                             IconButton(
                //                               onPressed: () { },
                //                               icon: const Icon(Icons.shopping_basket),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     )
                //                 ),
                //               ],
                //             )
                //         ),
                //         const Divider(height: 0.1,),
                //         SafeArea(
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 const CircleAvatar(
                //                   radius: 40,
                //                   backgroundImage: AssetImage('images/background1.jpg'),
                //                 ),
                //                 SizedBox(
                //                     height: height /5,
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //
                //                       children: [
                //                         const Text(
                //                           "Sunflower",
                //                           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                //                         ),
                //                         const Text(
                //                           "Rs. 500",
                //                           style: TextStyle(fontSize: 16.0),
                //                         ),
                //                         Row(
                //                           children: [
                //                             IconButton(
                //                               onPressed: () { },
                //                               //alignment: AlignmentDirectional.bottomCenter,
                //                               icon: const Icon(Icons.favorite_border),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                             IconButton(
                //                               onPressed: () { },
                //                               icon: const Icon(Icons.shopping_basket),
                //                               color: HexColor.fromHex('#4CD964'),
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     )
                //                 ),
                //               ],
                //             ),
                //         ),
                //         const Divider(height: 0.1,),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
  @override
  void didChangeDependencies(){
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if(arguments !=null){
      category = arguments['category'];
    }
    super.didChangeDependencies();
  }
}
class _ItemFilters extends ConsumerWidget{
  final _sortByOptions = [
    ItemSortModel(value: "createdAt",label: "Latest"),
    ItemSortModel(value: "-productPrice",label: "Price: High to Low"),
    ItemSortModel(value: "productPrice",label: "Price: Low to High"),
  ];

  _ItemFilters({
    Key? key,
    this.category,
  });
  @override
  Widget build(BuildContext context,WidgetRef ref){
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data)
        ],
      ),
    );
  }

}