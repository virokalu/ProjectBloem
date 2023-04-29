import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/components/product_cards.dart';
import 'package:project_bloem/models/item_filter.dart';
import 'package:project_bloem/models/pagination.dart';
import 'package:project_bloem/provider.dart';

import '../../components/back_button_icon.dart';
import '../../components/size.dart';
import '../../models/item_sort.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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

              //const SearchBar(),
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
                    _ItemFilters(category: category),
                    // Flexible(
                    //   fit: FlexFit.loose,
                    //   child:
                      _ItemList(),
                    //   flex: 1,
                    // ),
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
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    category = arguments['category'];
    super.didChangeDependencies();
  }
}
class _ItemFilters extends ConsumerWidget{
  final _sortByOptions = [
    ItemSortModel(value: "createdAt",label: "Latest"),
    ItemSortModel(value: "-price",label: "Price: High to Low"),
    ItemSortModel(value: "price",label: "Price: Low to High"),
  ];

  _ItemFilters({
    this.category,
  });
  final String? category;

  @override
  Widget build(BuildContext context,WidgetRef ref){
    final filterProvider = ref.watch(itemsFilterProvider);
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category!,
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            child: PopupMenuButton(
              onSelected: (sortBy){
                ItemFilterModel filterModel = ItemFilterModel(
                    paginationModel: PaginationModel(page: 0,pageSize: 10),
                    category: filterProvider.category,
                    sortBy: sortBy.toString());
                ref
                    .read(itemsFilterProvider.notifier)
                    .setItemFilter(filterModel);
                ref.read(itemNotifierProvider.notifier).getItems();

              },
              initialValue: filterProvider.sortBy,
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item){
                  return PopupMenuItem(
                      value: item.value,
                      child: InkWell(
                        child: Text(item.label!),
                      )
                  );
                }).toList();
            },
              icon: const Icon(Icons.filter_list_alt),
            ),
          )
        ],
      ),
    );
  }
}
class _ItemList extends ConsumerWidget{
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context,WidgetRef ref){
    final itemsState = ref.watch(itemNotifierProvider);

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        final itemsViewModel = ref.read(itemNotifierProvider.notifier);
        final itemsState = ref.watch(itemNotifierProvider);

        if(itemsState.hasNext){
          itemsViewModel.getItems();
        }
      }
    });

    //print(itemsState);
    if(itemsState.items.isEmpty){
      if(!itemsState.hasNext && !itemsState.isLoading){
        //print("here");
        return const Center(child: Text("No Items"),
        );
      }
      return const LinearProgressIndicator();
    }
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
        child: RefreshIndicator(
          onRefresh: () async{
            //print(" here");
            ref.read(itemNotifierProvider.notifier).refreshItems();
          },
          child: GridView.count(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            children:
              //#####################################card start here#####################################################
              List.generate(
                itemsState.items.length,
                    (index) {
                  var data = itemsState.items[index];
                  return CardBox(model: data);
                },

              ),

              //SizedBox(width: getProportionateScreenWidth(20)),
            ),

        ),


    );
    // return Expanded(
    //   child:
    //     Column(
    //       //mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Flexible(
    //           //fit: FlexFit.loose,
    //           flex: 1,
    //             child: GridView.count(
    //               crossAxisCount: 2,
    //               children: [
    //                 ...List.generate(
    //                   itemsState.items.length,
    //                       (index) {
    //                     var data = itemsState.items[index];
    //                     return ItemCard(model: data);
    //                   },
    //                 ),
    //               ]
    //           ),
    //         ),
    //       ],
    //     ),
    // );
  }

}