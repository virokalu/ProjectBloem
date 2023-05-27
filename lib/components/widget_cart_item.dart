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
  Widget build(BuildContext context) {
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

  Widget cartItemUI(BuildContext context) {
    const commonNameStyle = TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    final priceStyle = TextStyle(
      color: HexColor.fromHex('#4CD964'),
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
          child: Container(
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Half of the width or height to create a perfect circle
              child: Image.network(
                model.item.imgone,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 230,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  model.item.commonname,
                  style: commonNameStyle,
                ),
              ),
              Text(
                "Rs.${model.item.price.toString()}",
                style: priceStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // CustomStepper(
                    //   lowerLimit: 1,
                    //   upperLimit: 20,
                    //   stepValue: 1,
                    //   iconSize: 15.0,
                    //   value: model.qty.toInt(),
                    //   onChanged: (value) {
                    //     onQtyUpdate!(model, value["qty"], value["type"]);
                    //   },
                    // ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor.fromHex('#E7FFED'),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        model.qty.toInt().toString(),
                        style: TextStyle(
                          color: HexColor.fromHex('#4CD964'),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    // Text(model.qty.toInt().toString()),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: GestureDetector(
                        child: Icon(
                          Icons.delete,
                          color: HexColor.fromHex('#4CD964'),
                        ),
                        onTap: () {
                          //print(model);
                          onItemRemove!(model);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
