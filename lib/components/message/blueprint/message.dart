import 'package:chapp/components/message/blueprint/message_content_template.dart';
import 'package:chapp/components/message/blueprint/message_content_type.dart';
import 'package:chapp/components/message/blueprint/message_status.dart';
import 'package:chapp/model/datetime/datetime_stamp.dart';

abstract class Message {
  MessageStatus status;
  DateTime readTime;
  DateTime sentTime;

  final MessageContentTemplate content;

  Message({this.content});

  Message setReadTime(DateTime readTime) {
    this.readTime = readTime;
    this.status = MessageStatus.read;
    return this;
  }

  Message setSentTime(DateTime sentTime) {
    this.sentTime = sentTime;
    this.status = MessageStatus.sent;
    return this;
  }

  DateTime get activityTime;

  DateTimeStamp get activityTimeStamp {
    return DateTimeStamp.getStampOf(activityTime);
  }

  String get activityTimeStampIde {
    return DateTimeStamp.getTimeStampIdeOf(activityTimeStamp);
  }

  bool isUnRead() {
    return readTime == null;
  }

  MessageContentType get contentType {
    return content.contentType;
  }
}
