import 'package:chapp/components/blueprint/datetime_stamp.dart';
import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/divider/divider.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/message_template.dart';
import 'package:chapp/global/common.dart';
import 'package:flutter/material.dart';

class SingleChannelTimeline extends StatelessWidget {
  final SingleChannelConversation conversation;

  const SingleChannelTimeline({Key key, @required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    Iterator<Message> lifo = conversation.messages.reversed.iterator;
    String currentTimeStampIde;

    while (lifo.moveNext()) {
      DateTimeStamp msgActivityTimeStamp = lifo.current.activityTimeStamp;

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
          message: lifo.current,
          signColor: lifo.current is IncomingMessage && lifo.current.isUnRead()
              ? unReadMessageSignColor
              : null,
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
