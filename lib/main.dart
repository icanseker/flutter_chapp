import 'package:chapp/model/theme/chapp_theme.dart';
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
        primaryColor: ChappTheme.themePrimaryColor,
        fontFamily: ChappTheme.fontFamily,
      ),
      home: new ConversationsScreen(),
      routes: {
        ChatScreen.routeName: (ctx) => ChatScreen(),
      },
    );
  }
}
