import 'package:flutter/material.dart';
import 'package:project_bloem/screens/chat/replycard.dart';
import '../../Model/chatmodel.dart';
import '../../Model/messagemodel.dart';
import 'ownmessagecard.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class ChatPage extends StatefulWidget {
  const ChatPage({super.key,required this.chatmodel});
  final ChatModel chatmodel;
  final sourceId = 0;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  ScrollController _scrollcontroller = ScrollController();
  List<MessageModel> messages = [];
////////////////////////////////////////////////////////////////////////////////
  bool show = false;
  FocusNode focusNode = FocusNode(); 
  late IO.Socket socket;

  @override
  void initState(){
    super.initState();
    connect();
    focusNode.addListener(() {
      setState(() {
        show = false;
      });
    });
  }

  void connect(){
    socket = IO.io("http://192.168.43.122:3000",<String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
  });
    socket.connect();
    socket.onConnect((data) { 
        print("connected");
        socket.on("message", (msg) {
          print("<======= RECIVED MESSAGE ============>");
            print(msg);
          print("<=======================================>");

          setMessage('destination',msg["message"]);//render receiver message in chat
        });
    });
    socket.emit("passId",widget.chatmodel.id);
  }

  void sendMessage(String message,int sourceId,int targetId){
    setMessage("source",message);//render sender's message in chat

    var x = {"message": message,"sourceId": sourceId,"targetId": targetId};
    print("<======= SENDING MESSAGE ============>");
    print(x);
    print("<=======================================>");
    socket.emit("message",
      x
    );
  }

  void setMessage(String type, String message) {
    MessageModel messagemodel = MessageModel(type: type,message: message);
    setState(() {
        messages.add(messagemodel);
      
    });
  }
///////////////////////////////////////////////////////////////////////////////////////////

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leadingWidth: 70,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back,size: 24),
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
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(
                    child: Text('block'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height-200,
                child: ListView.builder(
                  controller: _scrollcontroller,
                  itemCount: messages.length,
                  itemBuilder: (context, index){
                    if(messages[index].type == 'source'){
                      print("send");
                      return OwnMessageCard(message: messages[index].message);
                    }
                    else{
                      print("receive");
                      return ReplyCard(message: messages[index].message);
                    }
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width-55,
                        child : Card(
                            margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
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
                              icon: Icon(Icons.attach_file), 
                              onPressed: (){
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context, 
                                  builder: (builder)=> bottomesheet()
                                );
                              },
                            ),
                            prefixIcon: Icon(Icons.message),
                          ),
                        ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CircleAvatar(
                        radius: 25,
                        child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: (){
                            _scrollcontroller.animateTo(_scrollcontroller.position.maxScrollExtent, duration: Duration(milliseconds: 3000), curve: Curves.easeOut);
                            sendMessage(_textController.text,widget.sourceId,widget.chatmodel.id);
                            _textController.clear;
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
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createIcon(Colors.indigo,Icons.insert_drive_file,"Document"),
                SizedBox(width: 70),
                createIcon(Colors.purple,Icons.insert_photo,"Gallary"),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createIcon(Colors.green.shade600,Icons.location_pin,"Location"),
                SizedBox(width: 70,),
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