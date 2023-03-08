import "package:flutter/material.dart";
//import "package:project_bloem/screens/homo_screen/home_screen.dart";

class IconWithText extends StatelessWidget {
  
  final IconData icon;
  final String text,address;

  const IconWithText({super.key,required this.icon,required this.text,required this.address});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Row(
        children: [
          Expanded(
           child: IconButton(
              onPressed: (){
                  if(icon == Icons.monitor_heart_rounded){Navigator.pushNamed(context, '/mybusket');}
                  else if(icon == Icons.sell){Navigator.pushNamed(context, '/selling');}
                  else if(icon == Icons.chat){Navigator.pushNamed(context, '/chat');}
                  else if(icon == Icons.settings){Navigator.pushNamed(context, '/setting');}
                  else if(icon == Icons.help){Navigator.pushNamed(context, '/help');}
                  else if(icon == Icons.error){Navigator.pushNamed(context, '/about us');}
                  else if(icon == Icons.logout){Navigator.pushNamed(context, '/login');}
               },
              icon: Icon(icon),
           ),
          ),
          SizedBox(width: width/5,),
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