import "package:flutter/material.dart";

class ButtonText extends StatelessWidget {
  var height,width,size;

  final String text;
  final IconData icon;

  ButtonText({super.key, required this.text, required this.icon});


  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
              color: const Color(0xFF4cd964),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
              color: const Color(0xFF4cd964),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 50,),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        //SizedBox(height: height*75),
        Container(

        ),
      ],
    );
  }
}