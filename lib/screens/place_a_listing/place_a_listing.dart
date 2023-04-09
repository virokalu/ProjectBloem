import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:project_bloem/screens/item_view/item_view_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/back_button_icon.dart';
import '../../components/button_components.dart';
import '../../components/color_components.dart';
import '../../components/size.dart';

import 'package:firebase_storage/firebase_storage.dart' as storage;

var _values = [
  "Cut Flowers",
  "Foliage Plants",
  "Pot Plants",
  "Landscaping Plants",
  "Bedded Plants",
  "Propagatory Plants / Nursery Plants",
  "Other",
];

late SharedPreferences preference;
String username="";
String? category;
final nameController = TextEditingController();
String? sciName;
final desController = TextEditingController();
final priceController = TextEditingController();
bool cashOnDelivery=false;
bool chatActivate=false;
String? itemSpecific;
String? imgOne;
String? imgTwo;
String? imgThree;
bool imageAdded = true;

class PlaceListing extends StatefulWidget {
  const PlaceListing({Key? key}) : super(key: key);

  @override
  State<PlaceListing> createState() => _PlaceListingState();
}

class _PlaceListingState extends State<PlaceListing> {


  final _formField = GlobalKey<FormState>();


  @override
  void initState(){
    super.initState();
    init();
  }
  Future init() async{
    preference = await SharedPreferences.getInstance();
    //String? fullname=preference.getString('fullname');
    String? user=preference.getString('username');
    //String? imgPath=preference.getString('imgPath');

    setState(() =>username=user!);
    //setState(() =>this.fullname=fullname!);
    // if(imgPath!=null){
    //   setState(() => profileimg=imgPath);
    // }

  }

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
    //bool isCheckedCashDev = false;
    //bool isCheckedChat = false;
    //String currentSelectedValue=_values[0];
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width/30),
          child: Form(
            key: _formField,
            child:ListView(
            children: [
              const ButtonText(text: "Create Listing", icon: Icons.add),

              //const BackButtonNHome(),

              SizedBox(height: height/100),

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
                child: DropdownButtonFormField<String>(
                  value: category,
                  onChanged: (String? newValue) {
                    setState(() {
                      category = newValue;
                    });
                  },
                  decoration: InputDecoration(

                    filled: true,
                    //errorText: category == null ? 'This field is required' : null, // Add this line

                    fillColor: HexColor.fromHex('#F3F1F1'),
                    labelText: "Category",

                    //labelText: 'Select an item',
                    hintText: 'Choose an item',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'required';
                    }
                    return null;
                  },
                  items: _values.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              // SizedBox(
              //
              //   height: height/11,
              //   child: FormField<String>(
              //
              //     builder: (FormFieldState<String> state) {
              //       return InputDecorator(
              //         decoration: InputDecoration(
              //
              //             filled: true,
              //             //errorText: category == null ? 'This field is required' : null, // Add this line
              //
              //             fillColor: HexColor.fromHex('#F3F1F1'),
              //             labelText: "Category",
              //
              //             //labelStyle: textStyle,
              //             //errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 16.0),
              //             hintText: 'Please select expense',
              //
              //             border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(20),
              //                 //borderSide: BorderSide.none
              //
              //             )
              //         ),
              //         isEmpty: category == null,
              //         child: DropdownButtonHideUnderline(
              //
              //           child: DropdownButton<String>(
              //
              //
              //             value: category,
              //             isDense: true,
              //             onChanged: (String? value) {
              //               // This is called when the user selects an item.
              //               setState(() {
              //                 category = value;
              //               });
              //             },
              //             items: _values.map((String value) {
              //               return DropdownMenuItem<String>(
              //                 value: value,
              //                 child: Text(value),
              //               );
              //             }).toList(),
              //           ),
              //         ),
              //       );
              //     },
              //
              //   ),
              // ),

              Text(
                "Add Common Name",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height/100),
              SizedBox(
                height: height/10,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Common Name",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          //borderSide: BorderSide.none
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "required";
                    }

                    return null;
                  },

                ),
              ),

              Text(
                "Add Scientific Name (optional)",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height/100),
              SizedBox(
                height: height/10,
                child: TextFormField(
                  //controller: ,
                  decoration: InputDecoration(
                      labelText: "Scientific Name",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          //borderSide: BorderSide.none
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
                height: height/10,
                child: TextFormField(
                  controller: desController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  expands: true,
                  decoration: InputDecoration(
                      labelText: "Description",
                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          //borderSide: BorderSide.none
                      ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "required";
                    }

                    return null;
                  },
                ),
              ),

              SizedBox(
                height: height/10,

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
                          imageAdded ? 'Maximum 3 images' : 'required',
                          style: imageAdded ? TextStyle(
                            fontSize: getProportionateScreenWidth(11),
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ) : TextStyle(
                              fontSize: getProportionateScreenWidth(11),
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                          ),
                        )

                      ],
                    ),
                    SizedBox(width: width/30),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: HexColor.fromHex('#F3F1F1'),
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () async{

                          final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
                          if (image== null) return;

                          DateTime now = DateTime.now();
                          //print(now); // prints the current date and time


                          final ref = storage.FirebaseStorage.instance.ref()
                              .child('itemImg').child(username).child("$username$now${basename(image.path)}");
                          final result = await ref.putFile(File(image.path));
                          final fileUrl = await result.ref.getDownloadURL();


                          setState(() => imgOne=fileUrl);
                          setState(() {
                            imageAdded=true;
                          });
                          // Open a file picker to select an image
                        },
                        child: imgOne == null
                            ? const Center(
                          child: Icon(
                            Icons.add_photo_alternate,
                            color: Colors.grey,
                            size: 30.0,
                          ),
                        )
                            : Image.network(
                          imgOne!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(width: width/30),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: HexColor.fromHex('#F3F1F1'),
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () async {

                          final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
                          if (image== null) return;

                          DateTime now = DateTime.now();
                          //print(now); // prints the current date and time


                          final ref = storage.FirebaseStorage.instance.ref()
                              .child('itemImg').child(username).child("$username$now${basename(image.path)}");
                          final result = await ref.putFile(File(image.path));
                          final fileUrl = await result.ref.getDownloadURL();


                          setState(() => imgTwo=fileUrl);
                          setState(() {
                            imageAdded=true;
                          });
                          // Open a file picker to select an image
                        },
                        child: imgTwo == null
                            ? const Center(
                          child: Icon(
                            Icons.add_photo_alternate,
                            color: Colors.grey,
                            size: 30.0,
                          ),
                        )
                            : Image.network(
                          imgTwo!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(width: width/30),

                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: HexColor.fromHex('#F3F1F1'),
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () async {

                          final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
                          if (image== null) return;

                          DateTime now = DateTime.now();
                          //print(now); // prints the current date and time


                          final ref = storage.FirebaseStorage.instance.ref()
                              .child('itemImg').child(username).child("$username$now${basename(image.path)}");
                          final result = await ref.putFile(File(image.path));
                          final fileUrl = await result.ref.getDownloadURL();


                          setState(() => imgThree=fileUrl);
                          setState(() {
                            imageAdded=true;
                          });
                          // Open a file picker to select an image
                        },
                        child: imgThree == null
                            ? const Center(
                          child: Icon(
                            Icons.add_photo_alternate,
                            color: Colors.grey,
                            size: 30.0,
                          ),
                        )
                            : Image.network(
                          imgThree!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              Text(
                "Pricing",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height/100),
              SizedBox(
                width: width/4,
                child: TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Price",

                      filled: true,
                      fillColor: HexColor.fromHex('#F3F1F1'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        //borderSide: BorderSide.none
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "required";
                    }

                    return null;
                  },

                ),
              ),

              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: cashOnDelivery,
                    onChanged: (bool? value) {
                      setState(() {
                        cashOnDelivery = value!;
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
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container();

                        },
                      );
                    },
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
                    value: chatActivate,
                    onChanged: (bool? value) {
                      setState(() {
                        chatActivate = value!;
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
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container();

                          },
                      );
                    },
                    child: const Icon(
                      Icons.contact_support,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                ],
              ),

              // Text(
              //   "Item Specifications",
              //   style: TextStyle(
              //     fontSize: getProportionateScreenWidth(18),
              //     color: Colors.black,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              // SizedBox(height: height/100),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: width/1.5,
              //       child: TextFormField(
              //
              //         decoration: InputDecoration(
              //             labelText: "Specification",
              //
              //             filled: true,
              //             fillColor: HexColor.fromHex('#F3F1F1'),
              //             border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(20),
              //                 //borderSide: BorderSide.none
              //             )
              //         ),
              //
              //       ),
              //     ),
              //     SizedBox(width: width/40),
              //     TextButton(
              //       style: TextButton.styleFrom(
              //         foregroundColor: Colors.black,
              //         backgroundColor: HexColor.fromHex('#F3F1F1'),
              //         minimumSize:  const Size(60, 60),
              //         padding: const EdgeInsets.symmetric(horizontal: 0.0),
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //         ),
              //       ),
              //       //################################################Add Specifications#######################################
              //       onPressed: () {},
              //       child: const Icon(
              //         Icons.add_circle,
              //         color: Colors.grey,
              //         size: 30.0,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: height/100),

              Row(
                children: [
                  SizedBox(
                    width: width/2.3,
                    child: TextButton(
                      style: greenButtonStyle,
                      //################################################save#######################################
                      onPressed: () {
                        if(imgThree?.isNotEmpty==true || imgOne?.isNotEmpty==true || imgTwo?.isNotEmpty==true){
                          setState(() {
                            imageAdded=true;
                          });

                        }else{
                          setState(() {
                            imageAdded=false;
                          });

                        }
                        if(_formField.currentState!.validate()){
                          //print("success");
                          //registerUser(context);
                          if(imageAdded){
                            //Navigator.pushNamed(context, '/mybusket');##################Save

                          }


                        }
                      },
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
                      onPressed: () {
                        if(imgThree?.isNotEmpty==true && imgOne?.isNotEmpty==true && imgTwo?.isNotEmpty==true){
                          setState(() {
                            imageAdded=true;
                          });

                        }else{
                          setState(() {
                            imageAdded=false;
                          });

                        }
                        if(_formField.currentState!.validate()){
                          //print("success");
                          //registerUser(context);
                          if(imageAdded){
                            Navigator.pushNamed(context, '/preview');

                          }


                        }
                      },
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
      ),
    );
  }
}
class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _Preview();
}

class _Preview extends State<Preview> {

  int currentIndex = 0;
  List<String> images = ['$imgOne','$imgTwo','$imgThree'];
  final PageController _pageController = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(width / 30),
            child: ListView(
                children: [
                  ItemViewComponents(text: '$category'),
                  const SizedBox(
                    height: 10,
                  ),

                Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.7,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: images.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (BuildContext context, int index) {
                          String? image = images[index];
                          if (image != 'null' && image.isNotEmpty) {
                            return Image.network(
                              image,
                              fit: BoxFit.cover,
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: MediaQuery.of(context).size.width * 0.35,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: HexColor.fromHex('#4CD964'),
                        onPressed: () {
                          setState(() {
                            currentIndex = (currentIndex - 1) % images.length;
                          });
                          _pageController.animateToPage(
                            currentIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: MediaQuery.of(context).size.width * 0.35,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        color: HexColor.fromHex('#4CD964'),
                        onPressed: () {
                          setState(() {
                            currentIndex = (currentIndex + 1) % images.length;
                          });
                          _pageController.animateToPage(
                            currentIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),
                  ],
                ),

              const SizedBox(

                height: 10,
              ),
              // Expanded(
              //   flex: 3,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         flex: 9,
              //         child: GestureDetector(
              //           onTap: () {
              //             showDialog(
              //                 context: context,
              //                 builder: (_) => const ImageDialog('images/112.jpg'));
              //           },
              //           child: Container(
              //             alignment: Alignment.center,
              //             decoration: BoxDecoration(
              //               border: Border.all(color: Colors.black),
              //               image: const DecorationImage(
              //                   fit: BoxFit.fill,
              //                   image: AssetImage('images/112.jpg')),
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //           flex: 5,
              //           child: Column(
              //             children: [
              //               Expanded(
              //                 flex: 5,
              //                 child: GestureDetector(
              //                   onTap: () {
              //                     showDialog(
              //                         context: context,
              //                         builder: (_) =>
              //                         const ImageDialog('images/112.jpg'));
              //                   },
              //                   child: Container(
              //                     alignment: Alignment.center,
              //                     decoration: BoxDecoration(
              //                       border: Border.all(color: Colors.black),
              //                       image: DecorationImage(
              //                           fit: BoxFit.fill,
              //                           image: AssetImage('images/112.jpg')),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 10,
              //               ),
              //               Expanded(
              //                 flex: 5,
              //                 child: GestureDetector(
              //                   onTap: () {
              //                     showDialog(
              //                         context: context,
              //                         builder: (_) =>
              //                         const ImageDialog('images/112.jpg'));
              //                   },
              //                   child: Container(
              //                     alignment: Alignment.center,
              //                     decoration: BoxDecoration(
              //                       border: Border.all(color: Colors.black),
              //                       image: DecorationImage(
              //                           fit: BoxFit.fill,
              //                           image: AssetImage('images/112.jpg')),
              //                     ),
              //                   ),
              //                 ),
              //               )
              //             ],
              //           )),
              //     ],
              //   ),
              // ),

                  SizedBox(
                    width: width,
                    child:Text(
                      nameController.text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              SizedBox(
                width: width,
                child: Text(
                  sciName != null ? '$sciName' : '',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(11),
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
                  SizedBox(
                    width: width,
                    child: const Text(
                      "Description",
                      textAlign: TextAlign.right,

                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),


              // Expanded(
              //   flex: 2,
              //   child: Container(
              //     padding: EdgeInsets.all(width / 30),
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       border: Border.all(color: Colors.black),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: const Column(
              //       children: [
              //
              //         Text(
              //             "Each 2.5-Inch Pot contains 1 plant Plant needs : Light Level:Full Sun(6 + hours of direct sunlight) Soil Moisture: Moist,Dry Fertilizer:when transplanted and then every 3-4 weeks"),
              //       ],
              //     ),
              //   ),
              // ),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    constraints: BoxConstraints(
                      minWidth: width,
                      maxWidth: width,
                      minHeight: 70,
                      maxHeight: 70,
                    ),
                    child: LimitedBox(
                      maxHeight: 4 * 20.0, // assuming font size is 20
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          desController.text,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width,
                child: Text(
                  "Rs.${priceController.text}",
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Expanded(
              //   flex: 3,
              //   child: Container(
              //     alignment: Alignment.center,
              //     child: Column(
              //       children: [
              //         Expanded(
              //           child: TextButton(
              //             style: greenButtonStyle,
              //             onPressed: () {
              //               // showModalBottomSheet(
              //               //   context: context,
              //               //   builder: (context) => bottomesheet(),
              //               //   backgroundColor: Colors.white,
              //               // );
              //             },
              //             child: const Text(
              //               "Buy Now",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 16.0,
              //                 fontFamily: 'Poppings',
              //               ),
              //             ),
              //           ),
              //         ),
              //         const SizedBox(height: 10),
              //         Expanded(
              //             child: TextButton(
              //               style: greenButtonBorderStyle,
              //               onPressed: () {},
              //               child: Text(
              //                 "Add Basket",
              //                 style: TextStyle(
              //                   color: HexColor.fromHex('#4CD964'),
              //                   fontSize: 16.0,
              //                   fontFamily: 'Poppins',
              //                 ),
              //               ),
              //             )),
              //         const SizedBox(height: 10),
              //         Expanded(
              //             child: TextButton(
              //               style: greenButtonBorderStyle,
              //               onPressed: () {},
              //               child: Text(
              //                 "Chat",
              //                 style: TextStyle(
              //                   color: HexColor.fromHex('#4CD964'),
              //                   fontSize: 16.0,
              //                   fontFamily: 'Poppins',
              //                 ),
              //               ),
              //             ))
              //       ],
              //     ),
              //   ),
              // ),

                  const SizedBox(
                    height: 10,
                  ),

                  TextButton(
                    style: greenButtonStyle,
                    //############################Buy Now##########################################
                    onPressed: () {
                      //Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      "Save the view",
                      style: TextStyle(
                        color: Colors.white,fontSize: 16.0,
                        fontFamily: 'Poppins',),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  TextButton(
                    style: greenButtonBorderStyle,
                    //############################Add Basket##########################################
                    onPressed: () {
                      //Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Add Basket",
                      style: TextStyle(
                        color: HexColor.fromHex('#4CD964'), fontSize: 16.0,
                        fontFamily: 'Poppins',),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),


                  TextButton(
                    style: chatActivate ? greenButtonBorderStyle
                    : greyButtonStyle,
                    //############################Chat#######################################
                    onPressed: chatActivate
                        ? () {}
                        : null,
                    child: Text(
                      "Chat",
                      style: TextStyle(
                        color: chatActivate? HexColor.fromHex('#4CD964') : Colors.grey,
                        fontSize: 16.0,
                        fontFamily: 'Poppins',),
                    ),
                  ),
            ]),
          ),
        ),
    );
  }}