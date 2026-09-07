import 'package:flutter/material.dart';

import 'package:flutter_application_1/home_screen.dart';

import 'package:flutter_application_1/chat_screen.dart';

class Asd extends StatelessWidget {
  const Asd({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),

        ChatScreen.routeName: (context) => const ChatScreen(),
      },
    );
  }
}
