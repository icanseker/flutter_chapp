import 'package:chapp/components/avatar/avatar_widget.dart';
import 'package:chapp/components/avatar/blueprint/avatar_badge.dart';
import 'package:chapp/components/avatar/blueprint/circle_avatar.dart';
import 'package:chapp/components/blueprint/datetime_stamp.dart';
import 'package:chapp/components/blueprint/datetime_stamp_category.dart';
import 'package:chapp/components/blueprint/person_status.dart';
import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/conversation/blueprint/multi_channel_conversation.dart';
import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/message_content_type.dart';
import 'package:chapp/components/message/blueprint/message_status.dart';
import 'package:chapp/components/message/blueprint/outgoing_message.dart';
import 'package:chapp/components/message/blueprint/text_message.dart';
import 'package:chapp/global/common.dart';
import 'package:chapp/global/conversations.dart';
import 'package:chapp/screen/chat.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ConversationCard extends StatefulWidget {
  final String conversationKey;

  const ConversationCard({Key key, @required this.conversationKey})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ConversationCardState(conversationKey);
  }
}

class _ConversationCardState extends State<ConversationCard> {
  final String conversationKey;
  Conversation conversation;

  _ConversationCardState(this.conversationKey) {
    conversation = globalConversationList[this.conversationKey];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(
          context,
          ChatScreen.routeName,
          arguments: {
            'conversation-key': conversationKey,
          },
        );
        setState(() {
          conversation = globalConversationList[conversationKey];
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: AvatarWidget(
                avatarShape: CircleShapedAvatar(radius: 30),
                avatarImage: conversation.avatar,
                borderSize: 1,
                borderColor: Colors.black,
                avatarBadge: (conversation is MultiChannelConversation)
                    ? null
                    : (conversation as SingleChannelConversation)
                                .personStatus !=
                            PersonStatus.online
                        ? null
                        : AvatarBadge(
                            position: Alignment.topRight,
                            color: PersonStatus.online.ideColor,
                            size: 12,
                            borderColor: Colors.white,
                            borderSize: 1,
                          ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    _titleWidget(
                      title: conversation.title,
                      unReadCount: conversation.unReadCount,
                      titlePrefix: conversation is MultiChannelConversation
                          ? Ionicons.people_circle_outline
                          : null,
                    ),
                    _lastMessageWidget(
                      lastMessage: conversation is SingleChannelConversation
                          ? (conversation as SingleChannelConversation)
                              .lastMessage
                          : (conversation as MultiChannelConversation)
                              .lastMessage
                              .value,
                      senderTitle: conversation is MultiChannelConversation
                          ? (conversation as MultiChannelConversation)
                                      .lastMessageSenderId ==
                                  myPersonalId
                              ? 'You'
                              : (conversation as MultiChannelConversation)
                                  .lastMessageSenderTitle
                          : null,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 75,
              child: _lastActivityTimeWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleWidget(
      {@required String title, IconData titlePrefix, int unReadCount = 0}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        titlePrefix != null
            ? Icon(titlePrefix, color: Colors.black54)
            : EmptyWidget(),
        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        unReadCount > 0
            ? Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.cyan),
                child: Text(
                  unReadCount > 99 ? '99' : unReadCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : EmptyWidget(),
      ],
    );
  }

  Widget _lastActivityTimeWidget() {
    DateTimeStamp lastActivityTimeStamp = conversation.lastActivityTimeStamp;

    if (lastActivityTimeStamp != null) {
      List<Widget> reWidgets = [];

      switch (lastActivityTimeStamp.category) {
        case DateTimeStampCategory.just_now:
          {
            reWidgets.add(Text(lastActivityTimeStamp.category.ide));
            break;
          }
        case DateTimeStampCategory.today:
          {
            reWidgets.add(Text(lastActivityTimeStamp.time));
            break;
          }
        case DateTimeStampCategory.yesterday:
          {
            reWidgets.add(Text(lastActivityTimeStamp.category.ide));
            reWidgets.add(Text(lastActivityTimeStamp.time));
            break;
          }
        case DateTimeStampCategory.two_days_before:
        case DateTimeStampCategory.three_days_before:
        case DateTimeStampCategory.four_days_before:
        case DateTimeStampCategory.five_days_before:
          {
            reWidgets.add(Text(lastActivityTimeStamp.day));
            reWidgets.add(Text(lastActivityTimeStamp.time));
            break;
          }
        default:
          {
            reWidgets.add(Text(lastActivityTimeStamp.date));
            reWidgets.add(Text(lastActivityTimeStamp.time));
            break;
          }
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: reWidgets,
      );
    }

    return EmptyWidget();
  }

  Widget _lastMessageWidget(
      {@required Message lastMessage, String senderTitle}) {
    Widget lastMessageHolder;
    if (lastMessage.contentType == MessageContentType.text) {
      lastMessageHolder = Row(
        children: [
          Expanded(
            child: Text(
              (lastMessage.content as TextMessage).text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      );
    } else {
      lastMessageHolder = EmptyWidget();
    }

    Widget lastMessageIconIde = Container();
    if (lastMessage is OutgoingMessage) {
      lastMessageIconIde = Container(
        width: 16,
        child: Icon(
          lastMessage.status.icon,
          size: 16,
          color: lastMessage.status.iconColor,
        ),
      );
    }

    return Column(
      children: [
        senderTitle != null
            ? Row(
                children: [
                  Expanded(
                    child: Text(
                      senderTitle + ':',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            : EmptyWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: lastMessageHolder),
            lastMessageIconIde,
          ],
        )
      ],
    );
  }
}
