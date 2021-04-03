import 'package:chapp/components/conversation/blueprint/multi_channel_conversation.dart';
import 'package:chapp/components/conversation/timeline/timeline.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/outgoing_message.dart';
import 'package:chapp/components/message/message_line.dart';
import 'package:chapp/global/people_list.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:flutter/material.dart';

class MultiChannelTimeline extends StatelessWidget {
  final MultiChannelConversation conversation;

  const MultiChannelTimeline({Key key, @required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> timelineWidgets = [];

    Iterator<MapEntry<String, List<MapEntry<String, Message>>>>
        timeStampedCMapIterator =
        conversation.timeStampedConversationMap.entries.iterator;

    String seriesTimeStampIde;
    List<MapEntry<String, Message>> timeStampedList;
    String seriesSenderId;
    String currentSenderId;
    String seriesSenderTitle;
    Color seriesSenderColorRep;
    int timeStampedListLength;
    Message currentMessage;
    List<Message> messageSeries;

    while (timeStampedCMapIterator.moveNext()) {
      seriesTimeStampIde = timeStampedCMapIterator.current.key;
      timeStampedList = timeStampedCMapIterator.current.value;
      timeStampedListLength = timeStampedList.length;
      messageSeries = null;

      for (int i = 0; i < timeStampedListLength; i++) {
        currentMessage = timeStampedList[i].value;
        currentSenderId = timeStampedList[i].key;

        if (currentSenderId != seriesSenderId) {
          if (messageSeries != null && messageSeries.isNotEmpty)
            timelineWidgets.add(
              _getMessageSeriesWidget(
                messageSeries.reversed.toList(),
                seriesSenderTitle,
                seriesSenderColorRep,
              ),
            );

          seriesSenderId = currentSenderId;
          seriesSenderTitle = peopleList[currentSenderId].title;
          seriesSenderColorRep =
              conversation.getMemberColorRepresentative(currentSenderId);

          messageSeries = null;
        }

        if (messageSeries == null) messageSeries = [];
        messageSeries.add(currentMessage);
      }

      if (messageSeries != null && messageSeries.isNotEmpty)
        timelineWidgets.add(
          _getMessageSeriesWidget(
            messageSeries.reversed.toList(),
            seriesSenderTitle,
            seriesSenderColorRep,
          ),
        );

      timelineWidgets.add(
        ConversationTimeline.getTimelineDivider(seriesTimeStampIde),
      );
    }

    return Wrap(
      children: timelineWidgets.reversed.toList(),
      runSpacing: 8,
    );
  }

  Widget _getMessageSeriesWidget(
    List<Message> messageSeries,
    String senderTitle,
    Color senderColorRep,
  ) {
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
      }

      if (i == 0) {
        seriesWidgets.add(
          MessageLine(
            message: currentMessage,
            signLineColor: currentMessage.isUnRead()
                ? ChappTheme.unReadMessageSignColor
                : null,
            title: senderTitle,
            titleColor: senderColorRep,
            activateTopRightBorderRadius: true,
            activateBottomLeftBorderRadius: true,
            activateBottomRightBorderRadius: true,
          ),
        );
      } else {
        seriesWidgets.add(
          Stack(
            children: [
              MessageLine(
                message: currentMessage,
                signLineColor: currentMessage.isUnRead()
                    ? ChappTheme.unReadMessageSignColor
                    : null,
                activateTopRightBorderRadius: true,
                activateBottomLeftBorderRadius: true,
                activateBottomRightBorderRadius: true,
              ),
            ],
          ),
        );
      }
    }

    return Wrap(
      children: seriesWidgets.toList(),
      runSpacing: 4,
    );
  }
}
