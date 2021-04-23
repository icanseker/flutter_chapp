import 'package:chapp/components/conversation/appbar/chatbar.dart';
import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/conversation/timeline/timeline.dart';
import 'package:chapp/components/typingbar/typing_bar.dart';
import 'package:chapp/global/conversations.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';

  @override
  State<StatefulWidget> createState() {
    return new _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context).settings.arguments;
    final String conversationKey = routeArgs['conversation-key'];
    Conversation conversation = globalConversationList[conversationKey];

    conversation.unReadCount = 0;

    return Scaffold(
      backgroundColor: ChappTheme.chatScreenBackground,
      appBar: ChatBar(
        title: conversation.title,
        avatarModel: conversation.avatarModel,
      ),
      body: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConversationTimeline(conversation: conversation),
            TypingBar(),
          ],
        ),
      ),
    );
  }
}
