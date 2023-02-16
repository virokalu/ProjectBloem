import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';

import '../../components/button_components.dart';
import '../../components/color_components.dart';
import '../../components/size.dart';

var _currencies = [
  "Food",
  "Transport",
  "Personal",
  "Shopping",
  "Medical",
  "Rent",
  "Movie",
  "Salary"
];

class PlaceListing extends StatefulWidget {
  const PlaceListing({Key? key}) : super(key: key);

  @override
  State<PlaceListing> createState() => _PlaceListingState();
}

class _PlaceListingState extends State<PlaceListing> {
  @override
  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.grey;
    }
    bool isCheckedCashDev = false;
    bool isCheckedChat = false;
    String currentSelectedValue=_currencies[0];
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width/30),
          child: ListView(
            children: [

              const BackButtonNHome(),

              SizedBox(height: height/100),

              Text(
                "Add Title",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height/100),
              SizedBox(
                height: height/12,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Title",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      )
                  ),

                ),
              ),

              Text(
                "Add Description",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height/100),
              SizedBox(
                height: height/12,
                child: TextFormField(

                  decoration: InputDecoration(
                      labelText: "Description",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      )
                  ),

                ),
              ),

              Text(
                "Select the Category",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height/100),
              // SizedBox(
              //   width: width/3,
              //   height: height/12,
              //   child: DropdownButton<String>(
              //
              //     value: list.first,
              //     icon: const Icon(Icons.expand_more),
              //     elevation: 18,
              //     style: const TextStyle(color: Colors.grey),
              //     // underline: Container(
              //     //   height: 2,
              //     //   color: Colors.deepPurpleAccent,
              //     // ),
              //
              //     dropdownColor: HexColor.fromHex('#F3F1F1'),
              //     borderRadius: BorderRadius.circular(20),
              //     onChanged: (String? value) {
              //       // This is called when the user selects an item.
              //       // setState(() {
              //       //   dropdownValue = value!;
              //       // });
              //     },
              //     items: list.map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //   ),
              // ),
              SizedBox(

                height: height/11,
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: HexColor.fromHex('#F3F1F1'),
                          labelText: "category",
                          //labelStyle: textStyle,
                          //errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Please select expense',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none

                          )
                      ),
                      isEmpty: currentSelectedValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: currentSelectedValue,
                          isDense: true,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              currentSelectedValue = value!;
                            });
                          },
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: height/12,

                child: Row(

                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Images",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Maximum 3 images",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(11),
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: width/30),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: HexColor.fromHex('#F3F1F1'),
                        minimumSize:  const Size(60, 60),
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      //################################################Add Images#######################################
                      onPressed: () {},
                      child: const Icon(
                        Icons.add_photo_alternate,
                        color: Colors.grey,
                        size: 30.0,
                      ),
                    ),
                    SizedBox(width: width/20),
                    Text(
                      "Pricing",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: width/40),
                    SizedBox(
                      width: width/4,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Price",

                            filled: true,
                            fillColor: HexColor.fromHex('#F3F1F1'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none
                            )
                        ),

                      ),
                    )


                  ],
                ),
              ),

              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedCashDev,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedCashDev = value!;
                      });
                    },
                  ),

                  Text(
                    "Cash on Delivery",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      //backgroundColor: HexColor.fromHex('#F3F1F1'),
                      minimumSize:  const Size(30, 30),
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    //################################################Cash on Delivery#######################################
                    onPressed: () {},
                    child: const Icon(
                      Icons.contact_support,
                      color: Colors.black,

                      size: 30.0,
                    ),
                  ),

                ],
              ),

              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedChat,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedChat = value!;
                      });
                    },
                  ),

                  Text(
                    "Activate the Chat",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      //backgroundColor: HexColor.fromHex('#F3F1F1'),
                      minimumSize:  const Size(30, 30),
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    //################################################Activat the chat#######################################
                    onPressed: () {},
                    child: const Icon(
                      Icons.contact_support,
                      color: Colors.black,

                      size: 30.0,
                    ),
                  ),

                ],
              ),


              Text(
                "Item Specifications",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height/100),
              Row(
                children: [
                  SizedBox(
                    width: width/1.5,
                    child: TextFormField(

                      decoration: InputDecoration(
                          labelText: "Specification",

                          filled: true,
                          fillColor: HexColor.fromHex('#F3F1F1'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none
                          )
                      ),

                    ),
                  ),
                  SizedBox(width: width/40),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: HexColor.fromHex('#F3F1F1'),
                      minimumSize:  const Size(60, 60),
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    //################################################Add Specifications#######################################
                    onPressed: () {},
                    child: const Icon(
                      Icons.add_circle,
                      color: Colors.grey,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height/100),

              Row(
                children: [
                  SizedBox(
                    width: width/2.3,
                    child: TextButton(
                      style: greenButtonStyle,
                      //################################################save#######################################
                      onPressed: () {},
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 16.0,
                          fontFamily: 'Poppins',),
                      ),
                    ),
                  ),
                  SizedBox(width: width/20,),
                  SizedBox(
                    width: width/2.3,
                    child: TextButton(
                      style: greenButtonBorderStyle,
                      //################################################Preview#######################################
                      onPressed: () {},
                      child: Text(
                        "Preview",
                        style: TextStyle(color: HexColor.fromHex('#4CD964'), fontSize: 16.0,
                          fontFamily: 'Poppins',),
                      ),
                    ),
                  ),

                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
