
import "package:flutter/material.dart";

class UserDetail extends StatelessWidget {
  final String name;
  final String image;


  const UserDetail({super.key,required this.name, required this.image});
   // user_details({required this.name});

  @override
  Widget build(BuildContext context) {




    return  Row(
        
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
              Row(
                children: [
                  
                  const Text("edit"),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            ],
          )
        ],

    );
  }
}