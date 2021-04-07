import 'package:chapp/components/avatar/blueprint/avatar_badge.dart';
import 'package:chapp/components/conversation/appbar/chatbar.dart';
import 'package:chapp/components/conversation/appbar/settings.dart';
import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/conversation/timeline/timeline.dart';
import 'package:chapp/components/typingbar/typing_bar.dart';
import 'package:chapp/global/conversations.dart';
import 'package:chapp/model/subject/person.dart';
import 'package:chapp/model/subject/person_status.dart';
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
      appBar: conversation is SingleChannelConversation
          ? ChatBar(
              title: conversation.title,
              subtitle: (conversation.subject as Person).status != null
                  ? (conversation.subject as Person).status.ide
                  : null,
              subtitleColor: (conversation.subject as Person).status.ideColor,
              avatarImage: conversation.avatar,
              avatarBadge: conversation.personStatus != PersonStatus.online
                  ? null
                  : AvatarBadge(
                      position: Alignment.topRight,
                      color: PersonStatus.online.ideColor,
                      size: ChatBarSettings.avatarBadgeSize,
                      borderColor: ChatBarSettings.avatarBadgeBorderColor,
                      borderSize: ChatBarSettings.avatarBadgeBorderSize,
                    ),
            )
          : ChatBar(
              title: conversation.title,
              avatarImage: conversation.avatar,
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
