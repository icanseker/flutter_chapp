import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/global/subject_list.dart';
import 'package:chapp/model/datetime/datetime_stamp.dart';
import 'package:chapp/model/subject/person.dart';
import 'package:chapp/model/subject/person_status.dart';
import 'package:chapp/model/subject/subject.dart';
import 'package:flutter/material.dart';

class SingleChannelConversation extends Conversation {
  final String personId;
  List<Message> messages = [];

  SingleChannelConversation(
      {@required String conversationId, @required this.personId})
      : super(id: conversationId);

  SingleChannelConversation addMessage(Message message) {
    messages.add(message);

    if (message is IncomingMessage && message.isUnRead()) unReadCount++;

    return this;
  }

  Message get lastMessage {
    return messages.last;
  }

  Person get person {
    return subjectList[this.personId];
  }

  @override
  DateTimeStamp get lastActivityTimeStamp =>
      lastMessage == null ? null : lastMessage.activityTimeStamp;

  @override
  String get title => person.title;

  @override
  Subject get subject => this.person;

  Map<String, List<Message>> get timeStampedConversationMap {
    Map<String, List<Message>> timeStampedMap = {};

    String currentDateTimeStampIde;
    Iterator<Message> messageIterator = messages.reversed.iterator;

    while (messageIterator.moveNext()) {
      currentDateTimeStampIde = messageIterator.current.activityTimeStampIde;

      if (!timeStampedMap.containsKey(currentDateTimeStampIde))
        timeStampedMap[currentDateTimeStampIde] = [];

      timeStampedMap[currentDateTimeStampIde].add(messageIterator.current);
    }

    return timeStampedMap;
  }
}
