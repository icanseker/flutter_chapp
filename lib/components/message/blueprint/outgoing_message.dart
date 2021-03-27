import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/message_content_template.dart';
import 'package:chapp/components/message/blueprint/message_status.dart';

class OutgoingMessage extends Message {
  DateTime createdTime;
  DateTime deliveredTime;

  OutgoingMessage(MessageContentTemplate content) : super(content: content) {
    status = MessageStatus.waiting_for_connection;
  }

  OutgoingMessage setCreatedTime(DateTime createdTime) {
    this.createdTime = createdTime;
    return this;
  }

  OutgoingMessage setDeliveredTime(DateTime deliveredTime) {
    this.deliveredTime = deliveredTime;
    this.status = MessageStatus.delivered;
    return this;
  }

  OutgoingMessage sendingErrorOccurred() {
    this.status = MessageStatus.send_error;
    return this;
  }

  @override
  DateTime get activityTime {
    return sentTime == null ? createdTime : sentTime;
  }

  @override
  OutgoingMessage setSentTime(DateTime sentTime) {
    super.setSentTime(sentTime);
    return this;
  }

  @override
  OutgoingMessage setReadTime(DateTime readTime) {
    super.setReadTime(readTime);
    return this;
  }
}
