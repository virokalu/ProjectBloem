import 'package:flutter/material.dart';
import 'package:project_bloem/components/widget_custom_stepper.dart';
import 'package:project_bloem/models/cart_item.dart';

import 'color_components.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
    required this.model,
    this.onQtyUpdate,
    this.onItemRemove,
  }): super(key: key);

  final CartItem model;
  final Function? onQtyUpdate;
  final Function? onItemRemove;

  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.white),
        child: cartItemUI(context),
      ),
    );
  }

  @override
  Widget cartItemUI(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0,10,10,5),
          child: Container(
            width: 100,
            alignment: Alignment.center,
            child: Image.network(
              model.item.imgone,
              height: 100,
              fit: BoxFit.fill,

            ),

          ),
        ),
        SizedBox(
          width: 230,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  model.item.commonname,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                model.item.price.toString(),
                style: const TextStyle(
                  color: Colors.lightGreenAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomStepper(
                      lowerLimit: 1,
                      upperLimit: 20,
                      stepValue: 1,
                      iconSize: 15.0,
                      value: model.qty.toInt(),
                      onChanged: (value){
                        onQtyUpdate!(model, value["qty"],value["type"]);
                      },
                  ),
                  const SizedBox(
                    width:20,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: GestureDetector(
                      child: Icon(
                        Icons.delete,
                        color: HexColor.fromHex('#4CD964'),
                      ),
                      onTap: (){
                        onItemRemove!(model);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
