import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/icons/custom_icons.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/message_status.dart';
import 'package:chapp/components/message/blueprint/message_template_sign_line_position.dart';
import 'package:chapp/components/message/blueprint/outgoing_message.dart';
import 'package:chapp/components/message/template/message_template.dart';
import 'package:chapp/components/swipeable/blueprint/swipe_definition.dart';
import 'package:chapp/components/swipeable/swipe_ability.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageLine extends StatelessWidget {
  final Message message;

  final bool activateTopLeftBorderRadius;
  final bool activateTopRightBorderRadius;
  final bool activateBottomLeftBorderRadius;
  final bool activateBottomRightBorderRadius;

  final String title;
  final Color titleColor;
  final IconData titlePrefix;

  final Color signLineColor;

  const MessageLine({
    Key key,
    @required this.message,
    this.activateTopLeftBorderRadius = false,
    this.activateTopRightBorderRadius = false,
    this.activateBottomLeftBorderRadius = false,
    this.activateBottomRightBorderRadius = false,
    this.title,
    this.titleColor,
    this.titlePrefix,
    this.signLineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * .75;

    if (message is IncomingMessage) {
      IncomingMessage inMessage = message;
      return SwipeAbility(
        leftSwipe: SwipeDefinition(
          background: Container(color: Colors.greenAccent),
        ),
        rightSwipe: SwipeDefinition(
          background: Container(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _getCustomMessageTemplate(
              maxWidth,
              ChappTheme.incomingMessageTemplateBackground,
              MessageTemplateSignLinePosition.left,
            ),
            Container(
              padding: EdgeInsets.all(4),
              child: Text(
                DateFormat.Hm().format(inMessage.receivedTime),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(
                CustomIcon.emotion,
                color: Colors.black45,
                size: 20,
              ),
            ),
          ],
        ),
      );
    } else if (message is OutgoingMessage) {
      OutgoingMessage outMessage = message;
      return SwipeAbility(
        leftSwipe: SwipeDefinition(
          background: Container(color: Colors.greenAccent),
        ),
        rightSwipe: SwipeDefinition(
          background: Container(color: Colors.grey),
        ),
        child: Row(
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
            _getCustomMessageTemplate(
              maxWidth,
              message.status == MessageStatus.send_error
                  ? ChappTheme.sendErrorOccurredMessageTemplateBackground
                  : message.status == MessageStatus.waiting_for_connection
                      ? ChappTheme.connectionWaitingMessageTemplateBackground
                      : ChappTheme.outgoingMessageTemplateBackground,
              MessageTemplateSignLinePosition.right,
            ),
          ],
        ),
      );
    }

    return EmptyWidget();
  }

  Widget _getCustomMessageTemplate(double maxWidth, Color backgroundColor,
      MessageTemplateSignLinePosition signLinePosition) {
    return Flexible(
      child: MessageTemplate(
        messageContent: message.content,
        maxWidth: maxWidth,
        backgroundColor: backgroundColor,
        title: this.title != null ? this.title : null,
        titlePrefix: this.titlePrefix != null ? this.titlePrefix : null,
        titleColor: this.titleColor != null ? this.titleColor : null,
        signLineColor: this.signLineColor != null ? this.signLineColor : null,
        signLinePosition: signLinePosition,
        activateTopRightBorderRadius: activateTopRightBorderRadius,
        activateTopLeftBorderRadius: activateTopLeftBorderRadius,
        activateBottomRightBorderRadius: activateBottomRightBorderRadius,
        activateBottomLeftBorderRadius: activateBottomLeftBorderRadius,
      ),
    );
  }
}
