import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/conversation/timeline/settings.dart';
import 'package:chapp/components/conversation/timeline/timeline.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/outgoing_message.dart';
import 'package:chapp/components/message/message_line.dart';
import 'package:flutter/material.dart';

class SingleChannelTimeline extends StatelessWidget {
  final SingleChannelConversation conversation;

  const SingleChannelTimeline({Key key, @required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> timelineWidgets = [];

    Iterator<MapEntry<String, List<Message>>> timeStampedCMapIterator =
        conversation.timeStampedConversationMap.entries.iterator;

    Type seriesMessageType;
    Type currentMessageType;
    String seriesTimeStampIde;
    List<Message> timeStampedList;
    int timeStampedListLength;
    Message currentMessage;
    List<Message> messageSeries;

    while (timeStampedCMapIterator.moveNext()) {
      seriesTimeStampIde = timeStampedCMapIterator.current.key;
      timeStampedList = timeStampedCMapIterator.current.value;
      timeStampedListLength = timeStampedList.length;
      messageSeries = null;

      for (int i = 0; i < timeStampedListLength; i++) {
        currentMessage = timeStampedList[i];
        currentMessageType = currentMessage.runtimeType;

        if (currentMessageType != seriesMessageType) {
          if (messageSeries != null && messageSeries.isNotEmpty)
            timelineWidgets.add(
              _getMessageSeriesWidget(messageSeries.reversed.toList()),
            );

          seriesMessageType = currentMessageType;
          messageSeries = null;
        }

        if (messageSeries == null) messageSeries = [];
        messageSeries.add(currentMessage);
      }

      if (messageSeries != null && messageSeries.isNotEmpty)
        timelineWidgets.add(
          _getMessageSeriesWidget(messageSeries.reversed.toList()),
        );

      timelineWidgets.add(
        ConversationTimeline.timelineDivider(seriesTimeStampIde),
      );
    }

    return Wrap(
      children: timelineWidgets.reversed.toList(),
      runSpacing: 8,
    );
  }

  Widget _getMessageSeriesWidget(List<Message> messageSeries) {
    List<Widget> seriesWidgets = [];
    int seriesLength = messageSeries.length;

    for (int i = 0; i < seriesLength; i++) {
      Message currentMessage = messageSeries[i];

      if (currentMessage is OutgoingMessage) {
        seriesWidgets.add(
          MessageLine(
            message: currentMessage,
            activateTopLeftBorderRadius: true,
            activateTopRightBorderRadius: true,
            activateBottomLeftBorderRadius: true,
          ),
        );
        continue;
      } else {
        seriesWidgets.add(
          MessageLine(
            message: currentMessage,
            signLineColor: currentMessage.isUnRead()
                ? ConversationTimelineSettings.unReadMessageSignColor
                : null,
            activateTopRightBorderRadius: true,
            activateBottomLeftBorderRadius: true,
            activateBottomRightBorderRadius: true,
          ),
        );
        continue;
      }
    }

    return Wrap(
      children: seriesWidgets.toList(),
      runSpacing: 4,
    );
  }
}
