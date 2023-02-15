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

                height: height/10,
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
                height: height/10,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: "Confirm Password",
                      filled: true,
                      fillColor: Colors.white38,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),

                ),
              ),
              TextButton(
                style: greenButtonStyle,
                //################################################Create Account#######################################
                onPressed: () {},
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white, fontSize: 16.0,
                    fontFamily: 'Poppins',),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
