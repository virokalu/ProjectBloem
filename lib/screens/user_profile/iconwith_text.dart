import "package:flutter/material.dart";

class IconWithText extends StatelessWidget {
  
  final IconData icon;
  final String text,address;

  IconWithText({required this.icon,required this.text,required this.address});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
           child: IconButton(
              onPressed: (){},
              icon: Icon(icon),
           ),
          ),
          Expanded(
            child: Text(
              text,
             // onPressed : (){},
              ),
          ),
         
        ],
      ),
    );
  }
}