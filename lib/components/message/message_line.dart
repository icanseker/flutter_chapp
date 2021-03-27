import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/message_status.dart';
import 'package:chapp/components/message/blueprint/outgoing_message.dart';
import 'package:chapp/components/message/template/incoming_message_template.dart';
import 'package:chapp/components/message/template/outgoing_message_template.dart';
import 'package:chapp/global/common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageLine extends StatelessWidget {
  final Message message;
  final Color signColor;
  final String title;
  final Color titleColor;
  final IconData titlePrefix;

  const MessageLine({
    Key key,
    @required this.message,
    this.signColor,
    this.title,
    this.titleColor = Colors.black,
    this.titlePrefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message is IncomingMessage) {
      IncomingMessage inMessage = message;
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: IncomingMessageTemplate(
              messageContent: inMessage.content,
              maxWidth: MediaQuery.of(context).size.width * .75,
              backgroundColor: incomingMessageTemplateBackground,
              title: this.title != null ? this.title : null,
              titlePrefix: this.titlePrefix != null ? this.titlePrefix : null,
              titleColor: this.titleColor != null ? this.titleColor : null,
              signColor: this.signColor != null ? this.signColor : null,
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            child: Text(
              DateFormat.Hm().format(inMessage.receivedTime),
            ),
          ),
        ],
      );
    }

    if (message is OutgoingMessage) {
      OutgoingMessage outMessage = message;

      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(4),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              spacing: 4,
              children: [
                Text(
                  DateFormat.Hm().format(outMessage.sentTime == null
                      ? outMessage.createdTime
                      : outMessage.sentTime),
                ),
                Icon(
                  outMessage.status.icon,
                  size: 14,
                  color: outMessage.status.iconColor,
                )
              ],
            ),
          ),
          Flexible(
            child: OutgoingMessageTemplate(
              messageContent: outMessage.content,
              maxWidth: MediaQuery.of(context).size.width * .75,
              backgroundColor: message.status == MessageStatus.send_error
                  ? sendErrorOccurredMessageTemplateBackground
                  : message.status == MessageStatus.waiting_for_connection
                      ? connectionWaitingMessageTemplateBackground
                      : outgoingMessageTemplateBackground,
              title: this.title != null ? this.title : null,
              titlePrefix: this.titlePrefix != null ? this.titlePrefix : null,
              titleColor: this.titleColor != null ? this.titleColor : null,
              signColor: this.signColor != null ? this.signColor : null,
            ),
          ),
        ],
      );
    }

    return EmptyWidget();
  }
}
