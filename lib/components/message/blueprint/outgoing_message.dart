import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/message_status.dart';
import 'package:chapp/components/message/blueprint/message_content_template.dart';

class OutgoingMessage extends Message {
  DateTime deliveredTime;

  OutgoingMessage(MessageContentTemplate content)
      : super(content: content);

  OutgoingMessage setDeliveredTime(DateTime deliveredTime) {
    this.deliveredTime = deliveredTime;
    this.status = MessageStatus.delivered;
    return this;
  }

  @override
  DateTime get activityTime {
    return sentTime;
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
