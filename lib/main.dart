import 'package:chapp/screen/chat.dart';
import 'package:chapp/screen/conversations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Chapp());
}

class Chapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        accentColor: Colors.red,
        fontFamily: 'Sarabun',
      ),
      home: new ConversationsScreen(),
      routes: {
        ChatScreen.routeName: (ctx) => ChatScreen(),
      },
    );
  }
}
