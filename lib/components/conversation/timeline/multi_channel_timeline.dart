import 'package:chapp/components/blueprint/datetime_stamp.dart';
import 'package:chapp/components/conversation/blueprint/multi_channel_conversation.dart';
import 'package:chapp/components/divider/divider.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/message_template.dart';
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

      widgetList.add(
        MessageTemplate(
          message: lifo.current.value,
          signColor: lifo.current.value is IncomingMessage &&
                  lifo.current.value.isUnRead()
              ? unReadMessageSignColor
              : null,
          title: peopleList[lifo.current.key].title,
          titleColor:
              conversation.getMemberColorRepresentative(lifo.current.key),
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
