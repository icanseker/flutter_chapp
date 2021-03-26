import 'package:chapp/components/blueprint/datetime_stamp.dart';
import 'package:chapp/components/blueprint/person.dart';
import 'package:chapp/components/blueprint/person_status.dart';
import 'package:chapp/components/blueprint/subject.dart';
import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/global/common.dart';
import 'package:chapp/global/people_list.dart';
import 'package:flutter/material.dart';

class SingleChannelConversation extends Conversation {
  final String personId;
  List<Message> messages = [];

  SingleChannelConversation({@required String conId, @required this.personId})
      : super(id: conId);

  SingleChannelConversation addMessage(Message message) {
    messages.add(message);

    if (message is IncomingMessage && message.isUnRead()) unReadCount++;

    return this;
  }

  Message get lastMessage {
    return messages.last;
  }

  Person get person {
    return peopleList[this.personId];
  }

  @override
  Image get avatar => person.avatarUrl == null
      ? defaultAvatar
      : Image.network(person.avatarUrl);

  @override
  DateTimeStamp get lastActivityTimeStamp =>
      lastMessage == null ? null : lastMessage.activityTimeStamp;

  @override
  String get title => person.title;

  PersonStatus get personStatus => person.status;

  @override
  Subject get subject => this.person;
}
