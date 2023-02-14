import "package:flutter/material.dart";

class IconWithText extends StatelessWidget {
  
  final IconData icon;
  final String text,address;

  const IconWithText({super.key,required this.icon,required this.text,required this.address});


  @override
  Widget build(BuildContext context) {
    var size,width,height;
    size = MediaQuery.of(context).size;
    width = size.width;
    return Row(
        children: [
          Expanded(
           child: IconButton(
              onPressed: (){},
              icon: Icon(icon),
           ),
          ),
          SizedBox(width: width/3,),
          Expanded(
            child: Text(
              text,
             // onPressed : (){},
              ),
          ),
         
        ],

    );
  }
}