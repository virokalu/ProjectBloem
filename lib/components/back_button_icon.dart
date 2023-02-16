

import "package:flutter/material.dart";
import "package:project_bloem/screens/homo_screen/home_screen.dart";

import "color_components.dart";

class ButtonText extends StatelessWidget {


  final String text;
  final IconData icon;

  const ButtonText({super.key, required this.text, required this.icon});


  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Row(
          children: [
            Ink(
            decoration: BoxDecoration(

              border: Border.all(color: HexColor.fromHex('#4CD964'), width: 2),
              borderRadius: BorderRadius.circular(35.0)
    ),
              width: 60,
              child:IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back,),
                color: HexColor.fromHex('#4CD964'),

              ),


            ),


            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              icon: const Icon(Icons.home_rounded),
              color: HexColor.fromHex('#33363F'),
    ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Icon(
                icon,
                size: 30,
                color: HexColor.fromHex('#33363F'),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: HexColor.fromHex('#33363F'),
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

class BackButtonNHome extends StatelessWidget {

  const BackButtonNHome({super.key});


  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Row(
          children: [
            Ink(
              decoration: BoxDecoration(

                  border: Border.all(color: HexColor.fromHex('#4CD964'), width: 2),
                  borderRadius: BorderRadius.circular(35.0)
              ),
              width: 60,
              child:IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back,),
                color: HexColor.fromHex('#4CD964'),

              ),


            ),


            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              icon: const Icon(Icons.home_rounded),
              color: HexColor.fromHex('#33363F'),
            ),
          ],
        ),

        //SizedBox(height: height*75),

      ],
    );
  }
}