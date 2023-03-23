import 'package:flutter/material.dart';
import 'package:project_bloem/screens/chat/replycard.dart';
import '../../Model/chatmodel.dart';
import '../../Model/messagemodel.dart';
import '../../components/color_components.dart';
import 'ownmessagecard.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;


class ChatPage extends StatefulWidget {
  const ChatPage({super.key,required this.chatmodel});
  final ChatModel chatmodel;
  final sourceId = 1;

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

  @override
  void dispose() {
    //print("Component unmounted");
    socket.dispose();
    super.dispose();
  }

  

  void connect(){
    socket = IO.io("http://localhost:3001",<String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
  });
    //print("Cumhere"); 
    //print(socket);
    socket.connect();
    socket.onConnect((data) { 
        //print("connected");
        socket.on("message", (msg) {
          //print("<======= RECIVED MESSAGE ============>");
          //print(msg);
          //print("<=======================================>");
          if (widget.sourceId != msg["sourceId"]) {
            setMessage('destination',msg["message"], msg["sourceId"], msg["targetId"]);//render receiver message in chat
          }
        });
    });
    socket.emit("passId",widget.chatmodel.id);
  }

  void sendMessage(String message,int sourceId,int targetId){
    setMessage("source",message, sourceId, targetId);//render sender's message in chat

    //var x = {"message": message,"sourceId": sourceId,"targetId": targetId};
    //print("<======= SENDING MESSAGE ============>");
    //print(x);
    //print("<=======================================>");
    socket.emit("message",
       {"message": message,"sourceId": sourceId,"targetId": targetId},
     );
    
  }

  void setMessage(String type, String message, int sourceId, int targetId){
    MessageModel messagemodel = MessageModel(type: type,message: message, sourceId: sourceId ,targetId: targetId, key: messages.length+1);
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
                    //print(index);
                    if(messages[index].type == 'source'){
                      return OwnMessageCard(message: messages[index].message);
                    } else {
                      return ReplyCard(message: messages[index].message);
                    }
              
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
                            sendMessage(_textController.text,widget.sourceId,widget.chatmodel.id);
                            _textController.clear();
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