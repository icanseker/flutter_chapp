import 'package:chapp/components/conversation/card/card.dart';
import 'package:chapp/components/divider/divider.dart';
import 'package:chapp/global/conversations.dart';
import 'package:chapp/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ConversationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.createMaterialColor(Color(0xFFFCFCFCFC)),
      appBar: AppBar(
        title: Text('Chapp'),
        actions: [
          IconButton(icon: Icon(Ionicons.search_outline), onPressed: () {}),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Ionicons.add_outline),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 3, // shadow
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Ionicons.chatbubbles_outline),
                iconSize: 32,
                onPressed: () {}),
            IconButton(
                icon: Icon(Ionicons.people_outline),
                iconSize: 32,
                onPressed: () {}),
            SizedBox(width: 32),
            IconButton(
                icon: Icon(Ionicons.call_outline),
                iconSize: 32,
                onPressed: () {}),
            IconButton(
                icon: Icon(Ionicons.settings_outline),
                iconSize: 32,
                onPressed: () {}),
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: globalConversationList.length,
          itemBuilder: (ctx, index) {
            String cKey = globalConversationList.keys.elementAt(index);

            return Column(
              children: [
                Container(child: ConversationCard(conversationKey: cKey)),
                HorizontalDivider(
                  dividerIndentAmount: 72,
                  dividerEndIndentAmount: 12,
                ),
              ],
            );
          },
        ),
        margin: EdgeInsets.only(top: 4),
      ),
    );
  }
}
