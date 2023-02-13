
import 'package:flutter/material.dart';
import 'package:project_bloem/components/size.dart';

import '../../../components/button_components.dart';
import '../../../components/color_components.dart';

class IconRow extends StatelessWidget {
  const IconRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 14),

      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  TextButton(
                    onPressed: () => {},
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
                    onPressed: () => {},
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


