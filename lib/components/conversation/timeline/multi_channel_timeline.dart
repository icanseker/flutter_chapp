import 'package:chapp/components/blueprint/datetime_stamp.dart';
import 'package:chapp/components/conversation/blueprint/multi_channel_conversation.dart';
import 'package:chapp/components/divider/divider.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/message_line.dart';
import 'package:chapp/global/common.dart';
import 'package:chapp/global/people_list.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MultiChannelTimeline extends StatelessWidget {
  final MultiChannelConversation conversation;

  const MultiChannelTimeline({Key key, @required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    Iterator<MapEntry<String, Message>> lifo =
        conversation.messages.reversed.iterator;
    String currentTimeStampIde;

    String currentSenderId;

    while (lifo.moveNext()) {
      DateTimeStamp msgActivityTimeStamp = lifo.current.value.activityTimeStamp;

      if (currentTimeStampIde == null) {
        currentTimeStampIde =
            DateTimeStamp.getTimeStampIdeOf(msgActivityTimeStamp);
      } else {
        String msgTimeStampIde =
            DateTimeStamp.getTimeStampIdeOf(msgActivityTimeStamp);

        if (msgTimeStampIde != currentTimeStampIde) {
          widgetList.add(HorizontalDivider(currentTimeStampIde));
          currentTimeStampIde = msgTimeStampIde;
        }
      }

      Message message = lifo.current.value;
      String senderId = lifo.current.key;
      String messageTitle;

      if (senderId != currentSenderId && senderId != myPersonalId) {
        messageTitle = peopleList[senderId].title;
        currentSenderId = senderId;
      } else
        messageTitle = null;

      if (messageTitle == null) // you sending
        widgetList.add(
          MessageLine(message: message),
        );
      else
        widgetList.add(
          MessageLine(
            message: message,
            signColor: message is IncomingMessage && message.isUnRead()
                ? unReadMessageSignColor
                : null,
            title: messageTitle,
            titleColor: conversation.getMemberColorRepresentative(senderId),
            titlePrefix: Ionicons.person_outline,
          ),
        );
    }

    widgetList.add(HorizontalDivider(currentTimeStampIde));

    return Wrap(
      children: widgetList.reversed.toList(),
      runSpacing: 8,
    );
  }
}
