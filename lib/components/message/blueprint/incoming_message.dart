import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/message_content_template.dart';
import 'package:chapp/components/message/blueprint/message_status.dart';

class IncomingMessage extends Message {
  DateTime receivedTime;

  IncomingMessage(MessageContentTemplate content) : super(content: content) {
    this.status = MessageStatus.received;
  }

  /*
      Normally receiveTime must define as final DateTime receivedTime = DateTime.now();
      And setReceivedTime function must be deleted.

      For the test purpose, receivedTime defined as DateTime receivedTime; and setReceivedTime function added
   */
  IncomingMessage setReceivedTime(DateTime receivedTime) {
    this.receivedTime = receivedTime;
    this.status = MessageStatus.received;
    return this;
  }

  @override
  DateTime get activityTime {
    return receivedTime;
  }

  @override
  IncomingMessage setSentTime(DateTime sentTime) {
    super.setSentTime(sentTime);
    return this;
  }

  @override
  IncomingMessage setReadTime(DateTime readTime) {
    super.setReadTime(readTime);
    return this;
  }
}
