import 'package:flutter/material.dart';

import '../../components/color_components.dart';

class ItemViewComponents extends StatelessWidget {
  final String text;
  final String category;
  //final IconData icon;

  const ItemViewComponents({super.key, required this.text,required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Ink(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: HexColor.fromHex('#4CD964'), width: 2),
                  borderRadius: BorderRadius.circular(35.0)),
              width: 60,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
                color: HexColor.fromHex('#4CD964'),
              ),
            ),
            const Spacer(),
            Text(
              category,
              style: const TextStyle(fontFamily: 'poppins', fontSize: 16),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text,
              style: const TextStyle(fontFamily: 'poppins', fontSize: 16),
            )
          ],
        ),


        //SizedBox(height: height*75),
        //Container(),
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
                  border:
                      Border.all(color: HexColor.fromHex('#4CD964'), width: 2),
                  borderRadius: BorderRadius.circular(35.0)),
              width: 60,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
                color: HexColor.fromHex('#4CD964'),
              ),
            ),
            const Spacer(),
          ],
        ),

        //SizedBox(height: height*75),
      ],
    );
  }
}
