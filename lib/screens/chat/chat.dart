import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_bloem/screens/chat/replycard.dart';
import '../../Model/chatmodel.dart';
import '../../Model/messagemodel.dart';
import '../../components/color_components.dart';
import '../login_screen/loginuserdetails.dart';
import 'othermessage.dart';
import 'ownmessagecard.dart';
import '../../config.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;


class ChatPage extends StatefulWidget {
  ChatPage({super.key,required this.chatmodel});
  final ChatModel chatmodel;
  final sourceName = UserDetails.username;
  //final targetName = chatmodel.name;
  //final targetName = chatmodel.name;
  // final targetId = 2;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollcontroller = ScrollController();
  List<MessageModel> messages = [];
////////////////////////////////////////////////////////////////////////////////
  bool show = false;
  FocusNode focusNode = FocusNode(); 
  late IO.Socket socket;

  // List<Map<String, dynamic>> _messages = [];

  // void fetchMessages() async {
  //   final response = await http.post(Uri.parse('http://localhost:3000/viewmessages'));

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     setState(() {
  //       _messages = data.cast<Map<String, dynamic>>();
  //     });
  //   } else {
  //     print('Failed to fetch messages');
  //   }
  //   print(_messages);
  // }

  Future<void> fetchMessages(String sourceName) async {

    var reqbody = {"user" : sourceName};

    final response = await http.post(Uri.parse("http://192.168.8.124:3000/viewmessages"),
    headers: {"Content-Type":"application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode(reqbody));
    final List<dynamic> responseData = jsonDecode(response.body);
    messages = responseData
        .map((json) => MessageModel(
              type: json['type'],
              message: json['message'],
              sourceName: json['sourceName'], 
              targetName: json['targetName'],
              time: DateTime.parse(json['time']), 
            ))
        .toList();
    setState(() {});
    //print(data);
  }

  Future<void> saveMessages() async {
    var reqbody = {
      "type" : "destination",
      "message" : _textController.text,
      "sourceName" : widget.sourceName,
      "targetName" : widget.chatmodel.name,
      "time" : DateTime.now().toString(),
    };

    await http.post(Uri.parse(addmessage),
        headers: {"Content-Type":"application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode(reqbody)
    );
  }


  @override
  void initState(){
    super.initState();
    fetchMessages(widget.sourceName);
    connect();
    focusNode.addListener(() {
      setState(() {
        show = false;
      });
    });
  }

  @override
  void dispose() {
    //print("Component unmounted");
    socket.dispose();
    super.dispose();
  }

  

  void connect(){
    socket = IO.io("http://192.168.8.124:3001",<String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
  });
    //print("Cumhere"); 
    //print(socket);
    socket.connect();
    socket.onConnect((data) { 
        print("connected");
        socket.on("message", (msg) {
          print("<======= RECIVED MESSAGE ============>");
          print(msg);
          print("<=======================================>");
          //if (widget.sourceId == msg["sourceId"]) {
            setMessage('destination',msg["message"], msg["sourceName"], msg["targetName"],DateTime.parse(msg["time"]));//render receiver message in chat
          //}
        });
    });
    socket.emit("passId",widget.chatmodel.name);
  }

  void sendMessage(String message,String sourceName,String targetName,DateTime time){
    //setMessage("source",message, sourceId, targetId);//render sender's message in chat

    var x = {"message": message,"sourceName": sourceName,"targetName": targetName,"time":time};
    print("<======= SENDING MESSAGE ============>");
    print(x);
    print(messages.length);
    print("<=======================================>");
    socket.emit("message",
       {"message": message,"sourceName": sourceName,"targetName": targetName,"time": time.toString()},
     );
    
  }

  void setMessage(String type, String message, String sourceName, String targetName,DateTime time){
    MessageModel messagemodel = MessageModel(type: type,message: message, sourceName: sourceName ,targetName: targetName, time: time);
    //print("Added message " + message);
    setState(() {
        messages.add(messagemodel);
    });
  }
///////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[600],
        appBar: AppBar(
          backgroundColor: HexColor.fromHex('#4CD964'),
          leadingWidth: 70,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_back,size: 24),
                CircleAvatar(
                  backgroundImage: AssetImage(widget.chatmodel.img),//if use stf use widget before call final variables
                  radius: 20,
                  backgroundColor: Colors.white,
                )
              ],
            ),
          ),
          title: Text(
            widget.chatmodel.name,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
            PopupMenuButton<String>(
              onSelected: (value) {
                //print(value);
              },
              itemBuilder: (BuildContext context){
                return [
                  const PopupMenuItem(
                    child: Text('block'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height-200,
                child: ListView.builder(
                  controller: _scrollcontroller,
                  itemCount: messages.length,
                  itemBuilder: (context, index){
                  //if(messages[index].targetName == widget.chatmodel.name){
                        print(messages[index].message);
                        if(messages[index].sourceName == widget.sourceName && messages[index].targetName == widget.chatmodel.name){
                          print("my message");
                          return OwnMessageCard(message: messages[index].message);
                        }
                        else if (messages[index].targetName == widget.sourceName && messages[index].sourceName == widget.chatmodel.name){
                          print("reply message");
                          return ReplyCard(message: messages[index].message);
                        } else {
                          print("Other message");
                          return const OtherMsg();
                        }
                  // else{
                  //   return null;
                  // }
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width-55,
                        child : Card(
                            margin: const EdgeInsets.only(left: 2,right: 2,bottom: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                            ),
                        child: TextFormField(
                          controller: _textController,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.attach_file), 
                              onPressed: (){
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context, 
                                  builder: (builder)=> bottomesheet()
                                );
                              },
                            ),
                            prefixIcon: const Icon(Icons.message),
                          ),
                        ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CircleAvatar(
                        radius: 25,
                        child: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: (){
                            _scrollcontroller.animateTo(_scrollcontroller.position.maxScrollExtent, duration: const Duration(milliseconds: 3000), curve: Curves.easeOut);
                            sendMessage(_textController.text,widget.sourceName,widget.chatmodel.name,DateTime.now());
                            setState(() {
                              saveMessages();
                            });
                            _textController.clear();
                            //print(messages);
                          },
                        ),
                      )
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget bottomesheet(){
    return SizedBox(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createIcon(Colors.indigo,Icons.insert_drive_file,"Document"),
                const SizedBox(width: 70),
                createIcon(Colors.purple,Icons.insert_photo,"Gallary"),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createIcon(Colors.green.shade600,Icons.location_pin,"Location"),
                const SizedBox(width: 70,),
                createIcon(Colors.blue,Icons.person,"Contact"),
              ],
            )
          ]
        ),
      ),
    );
  }

  Widget createIcon(Color color,IconData icon,String text){
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
            child: Icon(icon ,color: Colors.white,),
          ),
          Text(text),
        ],
      ),
    );
  }
}