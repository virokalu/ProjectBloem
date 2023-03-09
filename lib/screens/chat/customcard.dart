import 'package:flutter/material.dart';

import '../../Model/chatmodel.dart';
import 'chat.dart';

class CustomeCard extends StatelessWidget {
  const CustomeCard({super.key,required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(chatmodel: chatModel,)),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(chatModel.img),
        ),
        title: Text(
          chatModel.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.done_all),
            const SizedBox(width: 3),
            Text(
              chatModel.currentpage,
              style: const TextStyle(
                fontSize: 13,
              ),
            )
          ]
        ),
        trailing: Text(chatModel.time),
      ),
    );
  }
}