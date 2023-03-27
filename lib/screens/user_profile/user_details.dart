
import 'dart:io';

import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  late SharedPreferences preference;
  String fullname="";
  String username="";
  String profileimg='https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg';


  @override
  void initState(){
    super.initState();
    init();
  }
  Future init() async{
    preference = await SharedPreferences.getInstance();
    String? fullname=preference.getString('fullname');
    String? username=preference.getString('username');
    String? imgPath=preference.getString('imgPath');

    setState(() =>this.username=username!);
    setState(() =>this.fullname=fullname!);
    if(imgPath!=null){
      setState(() => profileimg=imgPath);
    }

  }

  @override
  Widget build(BuildContext context) {
    final img =  profileimg.contains('https://')
        ? NetworkImage(profileimg)
        : FileImage(File(profileimg));

    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3),
        //   ),
        // ],

        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: GestureDetector(
                  onTap: () async {
                    //final File file;

                    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (image== null) return;

                    final directory = await getApplicationSupportDirectory();
                    final name = basename(image.path);
                    final imageFile = File('${directory.path}/$name');
                    final newImage = await File(image.path).copy(imageFile.path);

                    setState(() => profileimg=newImage.path);
                    preference.setString('imgPath', newImage.path);

                    // var imageModel = {
                    //   "username" : username,
                    //   "img": jsonEncode(imageFile)
                    // };
                    // var response = await http.post(Uri.parse(profileImg),
                    //     headers: {"Content-Type":"application/json"},
                    //     body: jsonEncode(imageModel)
                    // );
                    // var jsonResponse = jsonDecode(response.body);
                    // if(jsonResponse['status']){
                    //   // ignore: use_build_context_synchronously
                    //   AwesomeDialog(
                    //     context: context,
                    //     dialogType: DialogType.success,
                    //     //dialogBackgroundColor: Colors.black,
                    //     animType: AnimType.topSlide,
                    //
                    //     showCloseIcon: true,
                    //     title: "Success!",
                    //     desc: "Profile Image Changed",
                    //
                    //     btnOkOnPress: () {
                    //
                    //     },
                    //     btnOkText: "OK",
                    //
                    //     btnOkColor: HexColor.fromHex('#4CD964'),
                    //   ).show();
                    //
                    // }else{
                    //
                    //   // ignore: use_build_context_synchronously
                    //   AwesomeDialog(
                    //     context: context,
                    //     dialogType: DialogType.warning,
                    //     //dialogBackgroundColor: Colors.black,
                    //     animType: AnimType.topSlide,
                    //
                    //     showCloseIcon: true,
                    //     title: "Fails!",
                    //     desc: "Profile Image Doesn't Changed Successfully",
                    //
                    //     btnOkOnPress: () {
                    //
                    //     },
                    //     btnOkText: "OK",
                    //
                    //     btnOkColor: HexColor.fromHex('#4CD964'),
                    //   ).show();
                    //
                    //
                    //
                    // }

                    // Add your onTap logic here
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: img as ImageProvider,
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                // decoration:  const BoxDecoration(
                //   shape: BoxShape.circle,
                //   image: DecorationImage(
                //     image: NetworkImage(
                //       'https://lh3.googleusercontent.com/a/AGNmyxZkok4px0PBrPFQhuc88Y8gHa5FWWb5hOggvuCeVg=s288',
                //     ),
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
              const SizedBox(width: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style:  const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 5),


                  Text(
                    fullname,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // Implement edit functionality here
            },
            child:  const Icon(
              Icons.edit,
              color: Colors.black54,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

