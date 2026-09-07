import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat_screen.dart';
import 'package:intl/intl.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final DateTime dateTime;
  final String imagePath;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.dateTime,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM').format(dateTime);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ChatScreen.routeName,
          arguments: {
            'name': name,
            'image': imagePath,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: const Color(0xFF673AB7),
          ),
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message,
            style: const TextStyle(color: Color(0xFFAAAAAA)),
          ),
          trailing: Text(
            formattedDate,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}