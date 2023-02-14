import 'dart:ui';

import "package:flutter/material.dart";

class userdetail extends StatelessWidget {
  final String name;
  final String image;
  var size,width,height;

   userdetail({required this.name, required this.image});
   // user_details({required this.name});

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;

    return Container(
      child: Row(
        
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
          //SizedBox(width: width/10,),
          Column(
            children: [
              Text(name,
                //textAlign: TextAlign.justif,
              ),
              Row(
                children: [
                  
                  Text("edit"),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}