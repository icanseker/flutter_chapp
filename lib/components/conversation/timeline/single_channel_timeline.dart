import 'package:chapp/components/blueprint/datetime_stamp.dart';
import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/divider/divider.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/message_line.dart';
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
    String currentMsgActivityTimeStampIde;
    DateTimeStamp currentMsgActivityTimeStamp;

    while (lifo.moveNext()) {
      currentMsgActivityTimeStamp = lifo.current.activityTimeStamp;

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

      widgetList.add(
        lifo.current is IncomingMessage
            ? MessageLine(
                message: lifo.current,
                signLineColor:
                    lifo.current.isUnRead() ? unReadMessageSignColor : null,
                activateTopRightBorderRadius: true,
                activateBottomLeftBorderRadius: true,
                activateBottomRightBorderRadius: true,
              )
            : MessageLine(
                message: lifo.current,
                activateTopLeftBorderRadius: true,
                activateTopRightBorderRadius: true,
                activateBottomLeftBorderRadius: true,
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
