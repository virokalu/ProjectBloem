import 'package:flutter/material.dart';
import 'package:project_bloem/components/color_components.dart';
import '../../components/back_button_icon.dart';
import '../../components/size.dart';

class searchResultScreen extends StatefulWidget{
  const searchResultScreen({super.key});

  @override
  _searchResultScreenState createState() => _searchResultScreenState();

}

class _searchResultScreenState extends State<searchResultScreen>{

  List<bool> expanded = [false, false];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(width/30),

            child: Column(
              children: [
                const ButtonText(text: "Search Results", icon: Icons.search_sharp),
                SizedBox(
                  height: height * 0.75,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(30),
                                vertical: getProportionateScreenWidth(20)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex('#86869E')
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: "Sunflower",
                            hintStyle: TextStyle(color: HexColor.fromHex('#86869E')),
                            prefixIcon: Icon(
                                Icons.search,
                                color: HexColor.fromHex('#86869E')
                            ),
                            suffixIcon: Icon(
                                Icons.close,
                                color: HexColor.fromHex('#86869E')
                            )
                          ),
                        ),

                        SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage('images/background1.jpg'),
                                ),
                                SizedBox(
                                    height: height /5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        const Text(
                                          "Sunflower",
                                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Rs. 500",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () { },
                                              //alignment: AlignmentDirectional.bottomCenter,
                                              icon: const Icon(Icons.favorite_border),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                            IconButton(
                                              onPressed: () { },
                                              icon: const Icon(Icons.shopping_basket),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            )
                        ),
                        const Divider(height: 0.1,),
                        SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage('images/background1.jpg'),
                                ),
                                SizedBox(
                                    height: height /5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        const Text(
                                          "Sunflower",
                                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Rs. 500",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () { },
                                              //alignment: AlignmentDirectional.bottomCenter,
                                              icon: const Icon(Icons.favorite_border),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                            IconButton(
                                              onPressed: () { },
                                              icon: const Icon(Icons.shopping_basket),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            )
                        ),
                        const Divider(height: 0.1,),
                        SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage('images/background1.jpg'),
                                ),
                                SizedBox(
                                    height: height /5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        const Text(
                                          "Sunflower",
                                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Rs. 500",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () { },
                                              //alignment: AlignmentDirectional.bottomCenter,
                                              icon: const Icon(Icons.favorite_border),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                            IconButton(
                                              onPressed: () { },
                                              icon: const Icon(Icons.shopping_basket),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            )
                        ),
                        const Divider(height: 0.1,),
                        SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage('images/background1.jpg'),
                                ),
                                SizedBox(
                                    height: height /5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        const Text(
                                          "Sunflower",
                                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Rs. 500",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () { },
                                              //alignment: AlignmentDirectional.bottomCenter,
                                              icon: const Icon(Icons.favorite_border),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                            IconButton(
                                              onPressed: () { },
                                              icon: const Icon(Icons.shopping_basket),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            )
                        ),
                        const Divider(height: 0.1,),
                        SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage('images/background1.jpg'),
                                ),
                                SizedBox(
                                    height: height /5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        const Text(
                                          "Sunflower",
                                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Rs. 500",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () { },
                                              //alignment: AlignmentDirectional.bottomCenter,
                                              icon: const Icon(Icons.favorite_border),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                            IconButton(
                                              onPressed: () { },
                                              icon: const Icon(Icons.shopping_basket),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            )
                        ),
                        const Divider(height: 0.1,),
                        SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage('images/background1.jpg'),
                                ),
                                SizedBox(
                                    height: height /5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        const Text(
                                          "Sunflower",
                                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Rs. 500",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () { },
                                              //alignment: AlignmentDirectional.bottomCenter,
                                              icon: const Icon(Icons.favorite_border),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                            IconButton(
                                              onPressed: () { },
                                              icon: const Icon(Icons.shopping_basket),
                                              color: HexColor.fromHex('#4CD964'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            )
                        ),
                        const Divider(height: 0.1,),
                      ],
                    )
                  )
                )
              ],
            ),
          ),
        ),
    );
  }
}