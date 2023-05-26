import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/chatmodel.dart';
import '../../components/button_components.dart';
import '../../components/color_components.dart';
import '../../config.dart';
import '../homo_screen/home_screen.dart';
import '../login_screen/loginuserdetails.dart';
import 'customcard.dart';
import 'package:http/http.dart' as http;

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  late SharedPreferences preference;
  //final _formField = GlobalKey<FormState>();
  final receiverController = TextEditingController();
  final senderController = TextEditingController();
  bool _isLoading = true;

  String user = UserDetails.username;
  //bool correctReciver = true;

  late List<ChatModel> chats = [];

  @override
  void initState() {
    super.initState();
    init();
    //registerChat();
  }
  Future init() async{
    preference = await SharedPreferences.getInstance();
    //String? fullname=preference.getString('fullname');
    String? username=preference.getString('username');
    //bool? sellerStates = preference.getBool('sellerStates');
    //print(token);

    // if(token==null){
    //   //print(token);
    //   // ignore: use_build_context_synchronously
    //   Navigator.pushNamed(context, '/login');
    // }
    setState(() =>user=username!);
    fetchData(user);

    //setState(() =>this.fullname=fullname!);

  }

  Future<void> registerChat(BuildContext context) async {
    //final completer = Completer<void>();
    senderController.text=user;
    final reqbody = {
      "name" : receiverController.text,
      "currentpage" : "I'am using Bloam app!",
      "user1" : user,
      "user2" : receiverController.text,
      "img" : "images/foliage.jpg",
      "id" : "5",
    };
    //var response = await http.post(Uri.parse(insertchats),
    final response = await http.post(Uri.parse(insertchats),
        headers: {"Content-Type":"application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode(reqbody),
    );
    //setState(() {});
    // if(response.statusCode == 500){
    //   correctReciver = false;
    // }
  }

  Future<void> fetchData(String user) async {
    //print(UserDetails.);
    var reqbody = {"user" : user};
    setState(() {
      _isLoading = true;
    });

    try{
      final response = await http.post(Uri.parse(chatdetails),
    headers: {"Content-Type":"application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode(reqbody));
    final List<dynamic> responseData = jsonDecode(response.body);
    chats = responseData
        .map((json) => ChatModel(
              name: json['name'],
              currentpage: json['currentpage'],
              id: int.parse(json['id']), 
              img: json['img'],
            ))
        .toList();
    }
    catch(e){
      setState(() {
        _isLoading = true;
      });
    }
    setState(() {
        _isLoading = false;
      });
    //print(data);
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor.fromHex('#4CD964'),
          leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,),
                  //color: HexColor.fromHex('#4CD964'),
    
                ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                icon: const Icon(Icons.home_rounded),
                color: HexColor.fromHex('#33363F'),
      ),
          ],
        ),
        body: _isLoading 
            ? const Center(child:CircularProgressIndicator())
            :ListView.builder(
                  itemCount: chats.length,
                 itemBuilder: (context, index) => CustomeCard(chatModel: chats[index],),
             ),
             floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context, 
                                  builder: (BuildContext context)=> bottomesheet(context)
                                );
                },
                child: const Icon(Icons.chat),
            ),
      ),
    );
  }
  // Widget bottomesheet(){
  //   return SizedBox(
  //     //height: 270,
  //     //width: MediaQuery.of(context).size.width,
  //     child: Card(
  //       margin: const EdgeInsets.all(18),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Row(
  //             children: [
  //               Text("From"),
  //             ],
  //           )
            
  //         ]
  //       ),
  //     ),
  //   );
  // }

   Widget bottomesheet(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 2,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Adjust the value to control the roundness of the corners
        ),
        //margin: EdgeInsets.all(MediaQuery.of(context).size.width/30),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top:15.0),
                  child: Text(
                    "Create new Chat",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text("From"),
                          const SizedBox(height: 20,),
                          TextFormField(
                            enabled: false,
                            initialValue: user,
                            // controller: senderController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                            ),
                            // keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 80),
                    Expanded(
                      child: Column(
                        children: [
                          const Text("To"),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: receiverController,
                            decoration: InputDecoration(
                              hintText: "Enter reciver username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                            style: greenButtonStyle,
                            onPressed: () {
                              setState(() {
                                registerChat(context);
                                fetchData(user);
                              });
                              // if(correctReciver){
                              //   print("x");
                              // }
                            },
                            child: const Text(
                                  "Create New Chat",
                                  style: TextStyle(color: Colors.white, fontSize: 16.0,
                                  fontFamily: 'Poppins',),
                            ),
                      ),
                    ),
                    
                  ],
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

