import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Model/chatmodel.dart';
import '../../components/button_components.dart';
import '../../components/color_components.dart';
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

  //final _formField = GlobalKey<FormState>();
  final receiverController = TextEditingController();
  final senderController = TextEditingController();

  String user = UserDetails.username;

  late List<ChatModel> chats;

  @override
  void initState() {
    super.initState();
    fetchData(user);
    //registerChat();
  }

  Future<void> registerChat(BuildContext context) async {
    //final completer = Completer<void>();
    senderController.text=user;
    final reqbody = {
      "name" : receiverController.text,
      "currentpage" : "jjj",
      "users" : [user,receiverController.text],
      "img" : "jj",
      "id" : "5",
    };
    var response = await http.post(Uri.parse('http://localhost:3000/insertchatlistdata'),
        headers: {"Content-Type":"application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode(reqbody),
    );
    //setState(() {});
  }

  Future<void> fetchData(String user) async {

    var reqbody = {"user" : user};

    final response = await http.post(Uri.parse('http://localhost:3000/chatlistdata'),
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
    setState(() {});
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
        body: ListView.builder(
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
    return SizedBox(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width/30),
        child: ListView(
          children: [Column(
            children: [
              const Text("Create new Chat"),
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
                          controller: senderController,
                          
                          decoration: InputDecoration(
                            hintText: "04/03",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                          keyboardType: const TextInputType.numberWithOptions(),
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
                            hintText: "12",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                          style: greenButtonStyle,
                          onPressed: () {
                            registerChat(context);
                            fetchData(user);
                          },
                          child: const Text(
                                "Cash on Delivery",
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
    );
  }
}

