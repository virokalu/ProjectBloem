import "package:flutter/material.dart";

// class IconWithText extends StatelessWidget {
//
//   final IconData icon;
//   final String text,address;
//
//   const IconWithText({super.key,required this.icon,required this.text,required this.address});
//
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var width = size.width;
//     return SizedBox(
//       height: 60,
//       child: InkWell(
//         onTap: () {
//                     if(icon == Icons.monitor_heart_rounded){Navigator.pushNamed(context, '/mybusket');}
//                     else if(icon == Icons.sell){}
//                     else if(icon == Icons.chat){
//                       Navigator.pushNamed(context, '/chat');
//                     }
//                     else if(icon == Icons.settings){}
//                     else if(icon == Icons.help){}
//                     else if(icon == Icons.error){}
//                     else if(icon == Icons.logout){Navigator.pushNamed(context, '/login');}
//         },
//         child: Row(
//             children: [
//               Expanded(
//                child: Icon(
//                   icon,
//                   size: 40,
//                ),
//               ),
//               SizedBox(width: width/3,),
//               Expanded(
//                 child: Text(
//                   text,
//                  // onPressed : (){},
//                   ),
//               ),
//
//             ],
//
//         ),
//       ),
//     );
//   }
// }
class ClickableBar extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback onPressed;

  const ClickableBar({super.key, required this.icon, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 50),
            Icon(icon, size: 28),
            const SizedBox(width: 25),
            Text(
                name,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),


          ],
        ),
      ),
    );
  }
}