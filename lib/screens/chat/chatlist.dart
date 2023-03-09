import 'package:flutter/material.dart';
import '../../Model/chatmodel.dart';
import '../../components/color_components.dart';
import '../homo_screen/home_screen.dart';
import 'customcard.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  List<ChatModel> chats = [
    ChatModel(
      name: "janaka lakshan",
      time: "4:00",
      currentpage: 'Hi janaka lakshan',
      img: 'images/background1.jpg',
      id: 1,
    ),
    ChatModel(
      name: "Manoj lakshan",
      time: "4:00",
      currentpage: 'Hi manoj lakshan',
      img: 'images/112.jpg',
      id: 2,
    ),
    ChatModel(
      name: "Ishan udayanga",
      time: "4:00",
      currentpage: 'Hi Ishan udayanga',
      img: 'images/background1.jpg',
      id: 3,
    ),
    ChatModel(
      name: "Anusha lakmali",
      time: "4:00",
      currentpage: 'Hi anusha lakmali',
      img: 'images/background1.jpg',
      id: 4,
    ),
    ChatModel(
      name: "Dinusha lakmali",
      time: "4:00",
      currentpage: 'Hi dinusha lakmali',
      img: 'images/background1.jpg',
      id: 5,
    ),
    ChatModel(
      name: "Sihina nimnath",
      time: "4:00",
      currentpage: 'Hi sihina nimnath',
      img: 'images/background1.jpg',
      id: 6,
    ),
    ChatModel(
      name: "Chanidu dilshan",
      time: "4:00",
      currentpage: 'Hi chanidu dilshan',
      img: 'images/background1.jpg',
      id: 7,
    ),
    ChatModel(
      name: "Indrajith madumal",
      time: "4:00",
      currentpage: 'Hi indrajith madumal',
      img: 'images/background1.jpg',
      id: 8,
    ),
    ChatModel(
      name: "Asanka madushan",
      time: "4:00",
      currentpage: 'Hi asanka madushan',
      img: 'images/background1.jpg',
      id: 9,
    ),
    ChatModel(
      name: "Hashan piumal",
      time: "4:00",
      currentpage: 'Hi hashan piumal',
      img: 'images/background1.jpg',
      id: 10,
    ),
    ChatModel(
      name: "Nirosh sanjeewa",
      time: "4:00",
      currentpage: 'Hi Nirosh sanjeewa',
      img: 'images/background1.jpg',
      id: 11,
    ),
    ChatModel(
      name: "Kavinda Dissanayaka",
      time: "4:00",
      currentpage: 'Hi kavinda dissanayaka',
      img: 'images/background1.jpg',
      id: 12,
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back,),
                color: HexColor.fromHex('#4CD964'),

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
    );
  }
}