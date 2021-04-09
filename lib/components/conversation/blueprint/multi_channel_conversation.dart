import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/global/common.dart';
import 'package:chapp/global/group_list.dart';
import 'package:chapp/global/people_list.dart';
import 'package:chapp/model/datetime/datetime_stamp.dart';
import 'package:chapp/model/subject/group.dart';
import 'package:chapp/model/subject/subject.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:flutter/material.dart';

class MultiChannelConversation extends Conversation {
  String groupId;

  List<MapEntry<String, Message>> messages = [];

  MultiChannelConversation({@required String conversationId, @required this.groupId})
      : super(id: conversationId);

  void addPerson(String personId) {
    if (!isParticipant(personId)) group.addMember(personId);
  }

  MultiChannelConversation addMessage(
      {String personId = myPersonalId, @required Message message}) {
    if (isParticipant(personId)) {
      messages.add(new MapEntry(personId, message));
      if (message is IncomingMessage && message.isUnRead()) {
        unReadCount++;
      }
    }

    return this;
  }

  bool isParticipant(String personId) {
    return group.isMember(personId);
  }

  MapEntry<String, Message> get lastMessage {
    return messages.last;
  }

  Color getMemberColorRepresentative(String memberId) {
    return group.getMemberColorRepresentative(memberId);
  }

  Group get group {
    return groupList[this.groupId];
  }

  @override
  Image get avatar => group.avatarUrl == null
      ? ChappTheme.defaultGroupAvatar
      : Image.network(group.avatarUrl);

  @override
  DateTimeStamp get lastActivityTimeStamp =>
      lastMessage == null ? null : lastMessage.value.activityTimeStamp;

  @override
  String get title => group.title;

  String get lastMessageSenderId => peopleList[lastMessage.key].id;

  String get lastMessageSenderTitle => peopleList[lastMessage.key].title;

  @override
  Subject get subject => this.group;

  Map<String, List<MapEntry<String, Message>>> get timeStampedConversationMap {
    Map<String, List<MapEntry<String, Message>>> timeStampedMap = {};

    String currentDateTimeStampIde;
    Iterator<MapEntry<String, Message>> messageIterator =
        messages.reversed.iterator;

    while (messageIterator.moveNext()) {
      currentDateTimeStampIde =
          messageIterator.current.value.activityTimeStampIde;

      if (!timeStampedMap.containsKey(currentDateTimeStampIde))
        timeStampedMap[currentDateTimeStampIde] = [];

      timeStampedMap[currentDateTimeStampIde].add(messageIterator.current);
    }

    return timeStampedMap;
  }
}
