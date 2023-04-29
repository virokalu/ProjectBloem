import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/models/item_sort.dart';
//import 'package:project_bloem/components/color_components.dart';
import '../../components/back_button_icon.dart';
import '../../components/product_cards.dart';
import '../../components/size.dart';
import '../../models/item_filter.dart';
import '../../models/pagination.dart';
import '../../provider.dart';
import '../homo_screen/home_components/home_components.dart';

class SearchResultScreen extends StatefulWidget{
  const SearchResultScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen>{


  String? commonname;
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

            child: Column(
                children: [
                  const BackButtonNHome(),
                  SizedBox(height: getProportionateScreenHeight(20)),

                  const SearchBar(),
                  SizedBox(height: getProportionateScreenHeight(20)),

                  Flexible(
                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            _ItemFilters(commonname: commonname),
                            _ItemList(),

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
  @override
  void didChangeDependencies(){
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    commonname = arguments['commonname'];
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
    this.commonname,
  });
  final String? commonname;

  @override
  Widget build(BuildContext context,WidgetRef ref){
    final filterProvider = ref.watch(itemsFilterProvider);
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
              "Search for - $commonname",
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
                    commonname: filterProvider.commonname,
                    //commonname:"test",
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

    if(itemsState.items.isEmpty){
      if(!itemsState.hasNext && !itemsState.isLoading){
        return const Center(child: Text("No Items"),
        );
      }
      return const LinearProgressIndicator();
    }
    return RefreshIndicator(
      onRefresh: () async{
        ref.read(itemNotifierProvider.notifier).refreshItems();
      },
      child: GridView.count(
        scrollDirection: Axis.vertical,
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
    );
  }
}