import 'package:flutter/material.dart';
import 'color_components.dart';

final ButtonStyle greenButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: HexColor.fromHex('#4CD964'),
  minimumSize: const Size(350, 60),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);