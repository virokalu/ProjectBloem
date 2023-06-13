import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/back_button_icon.dart';
import '../../components/color_components.dart';
import '../../components/product_cards.dart';
import '../../components/size.dart';
import '../../config.dart';
import '../../models/item.dart';
import 'package:http/http.dart' as http;

import '../place_a_listing/place_a_listing.dart';

var _values = [
  "Ampara",
  "Anuradhapura",
  "Badulla",
  "Batticaloa",
  "Colombo",
  "Galle",
  "Gampaha",
  "Hambantota",
  "Jaffna",
  "Kalutara",
  "Kandy",
  "Kegalle",
  "Kilinochchi",
  "Kurunegala",
  "Mannar",
  "Matale",
  "Matara",
  "Monaragala",
  "Mullativu",
  "Nuwara Eliya",
  "Polonnaruwa",
  "Puttalam",
  "Ratnapura",
  "Trincomalee",
  "Vavuniya"
];

class LocationBased extends StatefulWidget {
  const LocationBased({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationBasedState createState() => _LocationBasedState();
}

class _LocationBasedState extends State<LocationBased> {

  String? district;
  bool _isLoading=true;
  List<Item> locationItems = [];
  //String? commonname;
  List<bool> expanded = [false, false];

  late SharedPreferences preference;


  //int i=1;

  @override
  void initState(){
    super.initState();
    init();
  }

  Future init() async {
    preference = await SharedPreferences.getInstance();
    String? district=preference.getString('district');
    String? token = preference.getString('token');
    //sellerStates = preference.getBool('sellerStates');
    //print(token);
    //setState(() =>this.district=district!);

    if (token == null) {
      //print(token);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/login');
    }else{
      this.district=district;
      _fetchNews();

    }
    //
    //setState(() =>this.fullname=fullname!);
  }



  Future<void> _fetchNews() async {
    setState(() {
      locationItems.clear();
      _isLoading=true;
    });
    //i++;
    //print("run$i");

    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {

      'district': district!,
    };

    var url = Uri.http(apiURL, itemSearch, queryString);
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
      locationItems.clear();
      locationItems.addAll(itemsFromJson(data["data"]));
      setState(() => _isLoading = false);
    } else {
      return;
    }
  }
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width / 30),
          child: Column(
            children: [
              const BackButtonNHome(),
              SizedBox(height: getProportionateScreenHeight(20)),

              SizedBox(
                height: height/10,
                child: DropdownButtonFormField<String>(
                  value: district,
                  onChanged: (String? newValue) {
                    setState(() {
                      district = newValue;
                      _fetchNews();
                    });
                  },
                  decoration: InputDecoration(

                    filled: true,
                    //errorText: category == null ? 'This field is required' : null, // Add this line

                    fillColor: HexColor.fromHex('#F3F1F1'),
                    prefixIcon: const Icon(Icons.location_pin),
                    labelText: "District",

                    //labelText: 'Select an item',
                    hintText: 'Choose your district',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Required Field';
                    }
                    return null;
                  },
                  items: _values.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              //const SearchBar(),
              //SizedBox(height: getProportionateScreenHeight(20)),
              Flexible(
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ItemFilters(commonname: district),
                        _buildItemList(locationItems),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildItemList(List<Item> items) {
    if(_isLoading){
      return const Center(child: LinearProgressIndicator());
    }else if(items.isNotEmpty) {
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        children:
        //#####################################card start here#####################################################
        List.generate(
          items.length,
              (index) {
            var data = items[index];
            return CardBox(model: data);
          },

        ),

        //SizedBox(width: getProportionateScreenWidth(20)),
      );
    }else {
      return const Center(child: Text("No Items to View"));

    }

      //   SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     children: [
      //       //#####################################card start here#####################################################
      //       if (items.isEmpty)
      //         const Center(child: Text('No such Item, Please try Another..')),
      //       ...List.generate(
      //         items.length,
      //             (index) {
      //           var data = items[index];
      //           return SizedBox(
      //             height: getProportionateScreenWidth(250),
      //             child: CardBox(model: data),
      //           );
      //         },
      //       ),
      //       SizedBox(width: getProportionateScreenWidth(20)),
      //     ],
      //   ),
      // );
    }
  }
  // Widget _buildItemList(List<Item> items) {
  //   if (_isLoading) {
  //     return const Center(child: LinearProgressIndicator());
  //   } else {
  //     return SingleChildScrollView(
  //       scrollDirection: Axis.horizontal,
  //       child: Row(
  //         children: [
  //           if (items.isEmpty)
  //             const Center(child: Text('Create Listing to Display......')),
  //           Container(
  //             height: getProportionateScreenWidth(500),
  //             child: GridView.count(
  //               shrinkWrap: true,
  //               crossAxisCount: 2, // Set the number of widgets per line horizontally
  //               physics: const NeverScrollableScrollPhysics(), // Disable scrolling inside the GridView
  //               children: List.generate(items.length, (index) {
  //                 var data = items[index];
  //                 return CardBox(model: data);
  //               }),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }



class _ItemFilters extends ConsumerWidget {
  // final _sortByOptions = [
  //   ItemSortModel(value: "createdAt", label: "Latest"),
  //   ItemSortModel(value: "-productPrice", label: "Price: High to Low"),
  //   ItemSortModel(value: "productPrice", label: "Price: Low to High"),
  // ];

  const _ItemFilters({
    this.commonname,
  });
  final String? commonname;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final filterProvider = ref.watch(itemsFilterProvider);
    // return Container(
    //   height: 51,
    //   margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text("Search result for ${commonname!}")
    //     ],
    //   ),
    // );
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Items in - $commonname",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          // Container(
          //   decoration: const BoxDecoration(color: Colors.white),
          //   child: PopupMenuButton(
          //     onSelected: (sortBy) {
          //       ItemFilterModel filterModel = ItemFilterModel(
          //           paginationModel: PaginationModel(page: 0, pageSize: 10),
          //           commonname: filterProvider.commonname,
          //           //commonname:"test",
          //           sortBy: sortBy.toString());
          //       ref
          //           .read(itemsFilterProvider.notifier)
          //           .setItemFilter(filterModel);
          //       ref.read(itemNotifierProvider.notifier).getItems();
          //     },
          //     initialValue: filterProvider.sortBy,
          //     itemBuilder: (BuildContext context) {
          //       return _sortByOptions.map((item) {
          //         return PopupMenuItem(
          //             value: item.value,
          //             child: InkWell(
          //               child: Text(item.label!),
          //             ));
          //       }).toList();
          //     },
          //     icon: const Icon(Icons.filter_list_alt),
          //   ),
          // )
        ],
      ),
    );
  }
}

