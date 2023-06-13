import 'package:flutter/material.dart';
import 'package:project_bloem/components/size.dart';

import 'color_components.dart';

// ignore: must_be_immutable
class CustomStepper extends StatefulWidget {
  CustomStepper({
    Key? key,
    required this.lowerLimit,
    required this.upperLimit,
    required this.stepValue,
    required this.iconSize,
    required this.value,
    required this.onChanged
  }) : super(key: key);

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  int value;
  final ValueChanged<dynamic>onChanged;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor.fromHex('#E7FFED'),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Icon(
                Icons.remove,
                color: HexColor.fromHex('#4CD964'),
                size: 20,
              ),
            ),
            onTap: (){
              setState(() {
                widget.value = widget.value == widget.lowerLimit
                    ? widget.lowerLimit
                    : widget.value -= widget.stepValue;
                widget.onChanged({"qty": widget.value,"type":"-"});
              });
            },
          ),
          SizedBox(width: getProportionateScreenWidth(5),),

          SizedBox(
            width: widget.iconSize*2,
            child: Text(
              widget.value.toString(),
              style: TextStyle(
                fontSize: widget.iconSize,
                color: HexColor.fromHex('#4CD964'),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(5),),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Icon(
                Icons.add,
                color: HexColor.fromHex('#4CD964'),
                size: 20,
              ),
            ),
            onTap: (){
              setState(() {
                widget.value = widget.value == widget.upperLimit
                    ? widget.upperLimit
                    : widget.value += widget.stepValue;
                widget.onChanged({"qty": widget.value,"type":"+"});
              });
            },
          ),
          // SizedBox(
          //   width: widget.iconSize,
          //   child: Text(
          //     widget.value.toString(),
          //     style: TextStyle(
          //       fontSize: widget.iconSize*0.7,
          //       color: Colors.black,
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // )
        ],
      ),
    );
  }
}
