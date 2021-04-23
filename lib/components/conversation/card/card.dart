import 'package:chapp/components/avatar/avatar.dart';
import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/conversation/blueprint/multi_channel_conversation.dart';
import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/conversation/card/settings.dart';
import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/message_content_type.dart';
import 'package:chapp/components/message/blueprint/message_status.dart';
import 'package:chapp/components/message/blueprint/outgoing_message.dart';
import 'package:chapp/components/message/blueprint/text_message.dart';
import 'package:chapp/global/common.dart';
import 'package:chapp/global/conversations.dart';
import 'package:chapp/model/datetime/datetime_stamp.dart';
import 'package:chapp/model/datetime/datetime_stamp_category.dart';
import 'package:chapp/screen/chat.dart';
import 'package:flutter/material.dart';

class ConversationCard extends StatefulWidget {
  final String conversationKey;

  ConversationCard({Key key, @required this.conversationKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ConversationCardState();
  }
}

class _ConversationCardState extends State<ConversationCard> {
  Conversation conversation;

  @override
  void initState() {
    super.initState();
    conversation = globalConversationList[widget.conversationKey];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(
          context,
          ChatScreen.routeName,
          arguments: {
            'conversation-key': widget.conversationKey,
          },
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Avatar(
            model: conversation.avatarModel,
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
                        ? ConversationCardSettings.titlePrefix
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
          SizedBox(width: 14),
          _lastActivityTimeWidget(),
        ],
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
            ? Icon(
                titlePrefix,
                color: ConversationCardSettings.titlePrefixColor,
                size: ConversationCardSettings.titlePrefixSize,
              )
            : EmptyWidget(),
        Flexible(child: _titleTextWidget(title)),
        unReadCount > 0
            ? Container(
                margin: EdgeInsets.only(left: 4),
                height: ConversationCardSettings.unreadCountWrapperSize,
                width: ConversationCardSettings.unreadCountWrapperSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ConversationCardSettings.unreadCountWrapperColor,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      unReadCount > 99 ? '99+' : unReadCount.toString(),
                      style: TextStyle(
                        color: ConversationCardSettings.unreadCountFontColor,
                        fontSize: ConversationCardSettings.unreadCountFontSize,
                      ),
                    ),
                  ),
                ),
              )
            : EmptyWidget(),
      ],
    );
  }

  Widget _titleTextWidget(String title) {
    Text textWidget = Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: ConversationCardSettings.titleFontSize,
        fontWeight: FontWeight.w600,
      ),
    );

    return ConversationCardSettings.autoSizedTitleFontSize
        ? FittedBox(fit: BoxFit.fitWidth, child: textWidget)
        : textWidget;
  }

  Widget _lastActivityTimeWidget() {
    DateTimeStamp lastActivityTimeStamp = conversation.lastActivityTimeStamp;
    String firstLine;
    String secondLine;

    if (lastActivityTimeStamp != null) {
      switch (lastActivityTimeStamp.category) {
        case DateTimeStampCategory.just_now:
          {
            firstLine = lastActivityTimeStamp.category.ide;
            break;
          }
        case DateTimeStampCategory.today:
          {
            firstLine = lastActivityTimeStamp.time;
            break;
          }
        case DateTimeStampCategory.yesterday:
          {
            firstLine = lastActivityTimeStamp.category.ide;
            secondLine = lastActivityTimeStamp.time;
            break;
          }
        case DateTimeStampCategory.two_days_before:
        case DateTimeStampCategory.three_days_before:
        case DateTimeStampCategory.four_days_before:
        case DateTimeStampCategory.five_days_before:
          {
            firstLine = lastActivityTimeStamp.day;
            secondLine = lastActivityTimeStamp.time;
            break;
          }
        default:
          {
            firstLine = lastActivityTimeStamp.date;
            secondLine = lastActivityTimeStamp.time;
            break;
          }
      }

      if (firstLine == null && secondLine == null) return EmptyWidget();

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          firstLine != null
              ? Text(
                  firstLine,
                  style: TextStyle(
                    fontSize:
                        ConversationCardSettings.lastActivityTimeStampFontSize,
                    fontWeight: FontWeight.w400,
                    color:
                        ConversationCardSettings.lastActivityTimeStampFontColor,
                  ),
                )
              : EmptyWidget(),
          secondLine != null
              ? Text(
                  secondLine,
                  style: TextStyle(
                    fontSize:
                        ConversationCardSettings.lastActivityTimeStampFontSize,
                    fontWeight: FontWeight.w400,
                    color:
                        ConversationCardSettings.lastActivityTimeStampFontColor,
                  ),
                )
              : EmptyWidget(),
        ],
      );
    } else
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
                fontSize: ConversationCardSettings.lastMessageFontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    } else
      lastMessageHolder = EmptyWidget();

    Widget lastMessageIconIde = Container();
    if (lastMessage is OutgoingMessage) {
      lastMessageIconIde = Container(
        margin: EdgeInsets.only(right: 2),
        child: Icon(
          lastMessage.status.icon,
          size: ConversationCardSettings.lastMessageIconSize,
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
                      style: TextStyle(
                        fontSize: ConversationCardSettings.senderTitleFontSize,
                        color: ConversationCardSettings.senderTitleFontColor,
                      ),
                    ),
                  ),
                ],
              )
            : EmptyWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            lastMessageIconIde,
            Expanded(child: lastMessageHolder),
          ],
        )
      ],
    );
  }
}
