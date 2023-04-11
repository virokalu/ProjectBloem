
import 'package:flutter/material.dart';

import 'color_components.dart';



final ButtonStyle greenButtonStyle = TextButton.styleFrom(

  foregroundColor: Colors.black87,
  backgroundColor: HexColor.fromHex('#4CD964'),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
  fixedSize: const Size(327,56),

);
final ButtonStyle circularIconStyle = TextButton.styleFrom(
  foregroundColor: Colors.black,
  //backgroundColor: HexColor.fromHex('#4CD964'),
  minimumSize:  const Size(60, 60),
  padding: const EdgeInsets.symmetric(horizontal: 0.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);

final ButtonStyle greenButtonBorderStyle = TextButton.styleFrom(
  foregroundColor: const Color(0xFF000000),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
  side: BorderSide(color: HexColor.fromHex('#4CD964'), width: 2),
  fixedSize: const Size(327,56),
  textStyle: const TextStyle(
    fontSize: 16.0,
    fontFamily: 'Poppins',
  ),
);

final ButtonStyle greyButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: Colors.black12,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
  fixedSize: const Size(327,56),

);