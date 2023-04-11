import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String path;
  const ImageDialog(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 500,
        width: 500,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path)),
        ),
      ),
    );
  }
}
