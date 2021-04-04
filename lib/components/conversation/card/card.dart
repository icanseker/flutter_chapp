import 'package:chapp/components/avatar/avatar_widget.dart';
import 'package:chapp/components/avatar/blueprint/avatar_badge.dart';
import 'package:chapp/components/avatar/blueprint/circle_avatar.dart';
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
import 'package:chapp/model/datetime/datetime_stamp.dart';
import 'package:chapp/model/datetime/datetime_stamp_category.dart';
import 'package:chapp/model/subject/person_status.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:chapp/screen/chat.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ConversationCard extends StatefulWidget {
  final String conversationKey;

  const ConversationCard({Key key, @required this.conversationKey})
      : super(key: key);

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
        setState(() {
          conversation = globalConversationList[widget.conversationKey];
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: AvatarWidget(
              avatarShape: CircleShapedAvatar(
                radius: ChappTheme.conversationCardAvatarRadius,
              ),
              avatarImage: conversation.avatar,
              borderSize: 1,
              borderColor: Colors.black,
              avatarBadge: (conversation is MultiChannelConversation)
                  ? null
                  : (conversation as SingleChannelConversation).personStatus !=
                          PersonStatus.online
                      ? null
                      : AvatarBadge(
                          position: Alignment.topRight,
                          color: PersonStatus.online.ideColor,
                          size: ChappTheme.conversationCardAvatarBadgeSize,
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
                color: Colors.black54,
                size: ChappTheme.conversationCardTitleIconSize,
              )
            : EmptyWidget(),
        Flexible(child: _titleTextWidget(title)),
        unReadCount > 0
            ? Container(
                margin: EdgeInsets.only(left: 4),
                height: ChappTheme.conversationCardUnreadCountWrapperSize,
                width: ChappTheme.conversationCardUnreadCountWrapperSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  unReadCount > 99 ? '99' : unReadCount.toString(),
                  style: ChappTheme.conversationCardUnreadCountTextStyle,
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
      style: ChappTheme.conversationCardTitleTextStyle,
    );

    return ChappTheme.autoSizedConversationCardTitleText
        ? FittedBox(fit: BoxFit.fitWidth, child: textWidget)
        : textWidget;
  }

  Widget _lastActivityTimeWidget() {
    DateTimeStamp lastActivityTimeStamp = conversation.lastActivityTimeStamp;
    TextStyle lastActivityTimeStampTextStyle =
        ChappTheme.conversationCardLastActivityTextStyle;

    if (lastActivityTimeStamp != null) {
      List<Widget> reWidgets = [];

      switch (lastActivityTimeStamp.category) {
        case DateTimeStampCategory.just_now:
          {
            reWidgets.add(
              Text(
                lastActivityTimeStamp.category.ide,
                style: lastActivityTimeStampTextStyle,
              ),
            );
            break;
          }
        case DateTimeStampCategory.today:
          {
            reWidgets.add(
              Text(
                lastActivityTimeStamp.time,
                style: lastActivityTimeStampTextStyle,
              ),
            );
            break;
          }
        case DateTimeStampCategory.yesterday:
          {
            reWidgets.add(
              Text(
                lastActivityTimeStamp.category.ide,
                style: lastActivityTimeStampTextStyle,
              ),
            );
            reWidgets.add(
              Text(
                lastActivityTimeStamp.time,
                style: lastActivityTimeStampTextStyle,
              ),
            );
            break;
          }
        case DateTimeStampCategory.two_days_before:
        case DateTimeStampCategory.three_days_before:
        case DateTimeStampCategory.four_days_before:
        case DateTimeStampCategory.five_days_before:
          {
            reWidgets.add(
              Text(
                lastActivityTimeStamp.day,
                style: lastActivityTimeStampTextStyle,
              ),
            );
            reWidgets.add(
              Text(
                lastActivityTimeStamp.time,
                style: lastActivityTimeStampTextStyle,
              ),
            );
            break;
          }
        default:
          {
            reWidgets.add(
              Text(
                lastActivityTimeStamp.date,
                style: lastActivityTimeStampTextStyle,
              ),
            );
            reWidgets.add(
              Text(
                lastActivityTimeStamp.time,
                style: lastActivityTimeStampTextStyle,
              ),
            );
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
              style: ChappTheme.conversationCardLastMessageTextStyle,
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
        margin: EdgeInsets.only(right: 2),
        child: Icon(
          lastMessage.status.icon,
          size: ChappTheme.conversationCardLastMessageIconSize,
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
            lastMessageIconIde,
            Expanded(child: lastMessageHolder),
          ],
        )
      ],
    );
  }
}
