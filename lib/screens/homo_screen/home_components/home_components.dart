
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/components/size.dart';

import '../../../components/button_components.dart';
import '../../../components/color_components.dart';

class IconRow extends StatefulWidget {
  const IconRow({Key? key}) : super(key: key);

  @override
  State<IconRow> createState() => _IconRowState();
}

class _IconRowState extends State<IconRow> {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),

      child: SafeArea(
        top: false,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
        Column(
        children: [
        TextButton(
        onPressed: () async => {


            Navigator.pushNamed(context, '/profile'),


      },
        style: circularIconStyle,
        //padding: EdgeInsets.all(10.0),
        child: const Column( // Replace with a Row for horizontal icon + text
          children: <Widget>[
            Icon(
              Icons.perm_identity,
              size: 25,
              color: Colors.black45,
            ),
            Text("Profile",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),

      ],
    ),
    SizedBox(width: getProportionateScreenWidth(100)),


    Column(
    children: [
    TextButton(
    onPressed: () => {
        Navigator.pushNamed(context, '/mybusket'),
    },
    style: circularIconStyle,
    //padding: EdgeInsets.all(10.0),
    child: Column( // Replace with a Row for horizontal icon + text
    children: <Widget>[
    Icon(
    Icons.shopping_basket,
    size: 25,
    color: HexColor.fromHex('#4CD964'),

    ),
    Text(
    "Basket",
    style: TextStyle(
    color: HexColor.fromHex('#4CD964'),
    fontSize: 10,
    ),
    )
    ],
    ),
    ),

    ],
    ),
    ],
    )),
    );
  }
}

class SearchBarFilter extends StatelessWidget {

  const SearchBarFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final searchBarController = TextEditingController();

    return Row(

      children: [
        SizedBox(width: getProportionateScreenWidth(30)),
        Container(
          width: SizeConfig.screenWidth * 0.7,

          decoration: BoxDecoration(
            color: HexColor.fromHex('#F3F4F9'),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: searchBarController,
            //onChanged: () { },
            //################################################Search Onchange#######################################
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30),
                  vertical: getProportionateScreenWidth(20)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search product",
              hintStyle: TextStyle(color: HexColor.fromHex('#86869E')),

              // prefixIcon: Icon(
              //     Icons.search,
              //     color: HexColor.fromHex('#86869E',
              //     )
              // ),
            ),
          ),

        ),
        // IconButton(
        //   style: ,
        //   padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        //   //###############################################Filter ICon#################################
        //   onPressed: () {
        //
        //   },
        //   icon: const Icon(Icons.search),
        //   color: HexColor.fromHex('#33363F'),
        // ),
        SizedBox(width: getProportionateScreenWidth(10)),

        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(0)),
            height: getProportionateScreenWidth(55),
            width: getProportionateScreenWidth(55),
            decoration: BoxDecoration(
              color: HexColor.fromHex('#E7FFED'),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              onPressed: () {
                //print(searchBarController.text);
                  Navigator.of(context).pushNamed(
                      '/search',

                      arguments: {
                        'commonname':searchBarController.text,
                      }

                  );


              },
              //###################################################go to item when click##########
              icon: const Icon(Icons.search),
              color: HexColor.fromHex('#4CD964'),
            ),
          ),
        ),

      ],
    );
  }
}

class SearchBar extends ConsumerWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final searchController = TextEditingController();
    //final filterProvider = ref.watch(itemsFilterProvider);
    return Row(
      children: [
        SizedBox(width: getProportionateScreenWidth(10)),
        Container(
          width: SizeConfig.screenWidth * 0.7,

          decoration: BoxDecoration(
            color: HexColor.fromHex('#F3F4F9'),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: searchController,
            //onChanged: () { },
            //################################################Search Onchange#######################################
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30),
                  vertical: getProportionateScreenWidth(20)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search product",
              hintStyle: TextStyle(color: HexColor.fromHex('#86869E')),
              // prefixIcon: Icon(
              //     Icons.search,
              //     color: HexColor.fromHex('#86869E',
              //     )
              // ),
            ),
          ),

        ),
        SizedBox(width: getProportionateScreenWidth(10)),

        IconButton(
          //style: ,
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          //###############################################Filter ICon#################################
          onPressed: () {
            Navigator.of(context).pushNamed(
                '/search',
                arguments: {
                  'commonname':searchController.text,
                }

            );

          },
          icon: const Icon(Icons.search),
          color: HexColor.fromHex('#33363F'),
        ),
        SizedBox(width: getProportionateScreenWidth(10)),

        // InkWell(
        //   borderRadius: BorderRadius.circular(50),
        //   onTap: () {},
        //   child: Container(
        //     padding: EdgeInsets.all(getProportionateScreenWidth(0)),
        //     height: getProportionateScreenWidth(55),
        //     width: getProportionateScreenWidth(55),
        //     decoration: BoxDecoration(
        //       color: HexColor.fromHex('#E7FFED'),
        //       shape: BoxShape.circle,
        //     ),
        //     child: IconButton(
        //       padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        //       onPressed: () {
        //         ItemFilterModel filterModel = ItemFilterModel(
        //           paginationModel: PaginationModel(
        //               pageSize:  10,
        //               page: 1),
        //           commonname: userNameController.text,
        //         );
        //
        //         ref
        //             .read(itemsFilterProvider.notifier)
        //             .setItemFilter(filterModel);
        //         ref.read(itemNotifierProvider.notifier).getItems();
        //
        //         //print(ref);
        //         Navigator.of(context).pushNamed(
        //             '/search',
        //             arguments: {
        //               'commonname':userNameController.text,
        //             }
        //
        //         );
        //       },
        //       //###################################################go to item when click##########
        //       icon: const Icon(Icons.search),
        //       color: HexColor.fromHex('#4CD964'),
        //     ),
        //   ),
        // ),

      ],
    );
  }
}


class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: const Text(
            "See More",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}


