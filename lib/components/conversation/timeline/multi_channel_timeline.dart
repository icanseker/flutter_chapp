import 'package:chapp/components/blueprint/datetime_stamp.dart';
import 'package:chapp/components/conversation/blueprint/multi_channel_conversation.dart';
import 'package:chapp/components/divider/divider.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/outgoing_message.dart';
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

    Message currentMessage;
    DateTimeStamp currentMsgActivityTimeStamp;
    String currentMsgActivityTimeStampIde;
    String currentTimeStampIde;
    String currentSenderId;
    String currentSenderTitle;
    Color currentSenderColorRep;

    while (lifo.moveNext()) {
      currentMsgActivityTimeStamp = lifo.current.value.activityTimeStamp;

      if (currentTimeStampIde == null) {
        currentTimeStampIde =
            DateTimeStamp.getTimeStampIdeOf(currentMsgActivityTimeStamp);
      } else {
        currentMsgActivityTimeStampIde =
            DateTimeStamp.getTimeStampIdeOf(currentMsgActivityTimeStamp);

        if (currentMsgActivityTimeStampIde != currentTimeStampIde) {
          widgetList.add(HorizontalDivider(currentTimeStampIde));
          currentTimeStampIde = currentMsgActivityTimeStampIde;
        }
      }

      currentMessage = lifo.current.value;

      if (currentMessage is OutgoingMessage) {
        widgetList.add(
          MessageLine(
            message: currentMessage,
            activateTopLeftBorderRadius: true,
            activateTopRightBorderRadius: true,
            activateBottomLeftBorderRadius: true,
          ),
        );
      } else {
        String senderId = lifo.current.key;
        if (senderId != currentSenderId) {
          currentSenderTitle = peopleList[senderId].title;
          currentSenderId = senderId;
          currentSenderColorRep =
              conversation.getMemberColorRepresentative(senderId);

          widgetList.add(
            MessageLine(
              message: currentMessage,
              signLineColor:
                  currentMessage.isUnRead() ? unReadMessageSignColor : null,
              title: currentSenderTitle,
              titleColor: currentSenderColorRep,
              titlePrefix: Ionicons.person_outline,
              activateTopRightBorderRadius: true,
              activateBottomLeftBorderRadius: true,
              activateBottomRightBorderRadius: true,
            ),
          );
        } else
          widgetList.add(
            MessageLine(
              message: currentMessage,
              signLineColor:
                  currentMessage.isUnRead() ? unReadMessageSignColor : null,
              activateTopRightBorderRadius: true,
              activateBottomLeftBorderRadius: true,
              activateBottomRightBorderRadius: true,
            ),
          );
      }
    }

    widgetList.add(HorizontalDivider(currentTimeStampIde));

    return Wrap(
      children: widgetList.reversed.toList(),
      runSpacing: 8,
    );
  }
}
