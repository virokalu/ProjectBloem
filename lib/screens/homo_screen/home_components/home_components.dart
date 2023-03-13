
import 'package:flutter/material.dart';
import 'package:project_bloem/components/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/button_components.dart';
import '../../../components/color_components.dart';


class IconRow extends StatefulWidget {
  const IconRow({Key? key}) : super(key: key);

  @override
  State<IconRow> createState() => _IconRowState();
}

class _IconRowState extends State<IconRow> {

  late SharedPreferences prefs;
  bool isLoggedIn = false;

  @override
  void initState(){
    super.initState();
    initSharedPref();

  }
  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  }

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

          if (isLoggedIn) {
            Navigator.pushNamed(context, '/profile'),
          } else {
            Navigator.pushNamed(context, '/login'),
          }

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
      if (isLoggedIn) {
        Navigator.pushNamed(context, '/mybusket'),
      } else {
        Navigator.pushNamed(context, '/login'),
      }

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
              prefixIcon: Icon(
                  Icons.search,
                  color: HexColor.fromHex('#86869E',
                  )
              ),
            ),
          ),

        ),
        IconButton(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          //###############################################Filter ICon#################################
          onPressed: () { },
          icon: const Icon(Icons.menu),
          color: HexColor.fromHex('#33363F'),
        ),

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


