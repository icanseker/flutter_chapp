import 'package:chapp/components/conversation/timeline/settings.dart';
import 'package:chapp/components/conversation/timeline/timeline.dart';
import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/message/blueprint/incoming_message.dart';
import 'package:chapp/components/message/blueprint/message.dart';
import 'package:chapp/components/message/blueprint/message_status.dart';
import 'package:chapp/components/message/blueprint/message_template_sign_line_position.dart';
import 'package:chapp/components/message/blueprint/outgoing_message.dart';
import 'package:chapp/components/message/template/message_template.dart';
import 'package:chapp/components/swipeable/blueprint/icon_swipe_definition.dart';
import 'package:chapp/components/swipeable/icon_swipe_ability.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

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
      return IconSwipeAbility(
        simultaneityController:
            ConversationTimeline.swipeSimultaneityController,
        contextWidth: MediaQuery.of(context).size.width,
        leftSwipe: IconSwipeDefinition(
          iconData: Ionicons.arrow_undo_outline,
          brightenEffect: true,
          iconLabel: 'Forward',
        ),
        rightSwipe: IconSwipeDefinition(
          iconData: Ionicons.arrow_redo_outline,
          brightenEffect: true,
          iconLabel: 'Reply',
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _getCustomMessageTemplate(
              maxWidth,
              TextStyle(
                fontSize: ConversationTimelineSettings.messageFontSize,
              ),
              ConversationTimelineSettings.incomingMessageTemplateBackground,
              MessageTemplateSignLinePosition.left,
            ),
            Container(
              padding: EdgeInsets.all(4),
              child: Text(
                DateFormat.Hm().format(inMessage.receivedTime),
                style: TextStyle(
                  fontSize:
                      ConversationTimelineSettings.messageTimeStampFontSize,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (message is OutgoingMessage) {
      OutgoingMessage outMessage = message;
      return IconSwipeAbility(
        simultaneityController:
            ConversationTimeline.swipeSimultaneityController,
        contextWidth: MediaQuery.of(context).size.width,
        leftSwipe: IconSwipeDefinition(
          iconData: Ionicons.arrow_undo_outline,
          brightenEffect: true,
          iconLabel: 'Forward',
        ),
        rightSwipe: IconSwipeDefinition(
          iconData: Ionicons.arrow_redo_outline,
          brightenEffect: true,
          iconLabel: 'Reply',
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
                    style: TextStyle(
                      fontSize:
                          ConversationTimelineSettings.messageTimeStampFontSize,
                    ),
                  ),
                  Icon(
                    outMessage.status.icon,
                    size: ConversationTimelineSettings.messageStatusIconSize,
                    color: outMessage.status.iconColor,
                  )
                ],
              ),
            ),
            _getCustomMessageTemplate(
              maxWidth,
              TextStyle(
                fontSize: ConversationTimelineSettings.messageFontSize,
              ),
              message.status == MessageStatus.send_error
                  ? ConversationTimelineSettings
                      .sendErrorOccurredMessageTemplateBackground
                  : message.status == MessageStatus.waiting_for_connection
                      ? ConversationTimelineSettings
                          .connectionWaitingMessageTemplateBackground
                      : ConversationTimelineSettings
                          .outgoingMessageTemplateBackground,
              MessageTemplateSignLinePosition.right,
            ),
          ],
        ),
      );
    }

    return EmptyWidget();
  }

  Widget _getCustomMessageTemplate(double maxWidth, TextStyle messageTextStyle,
      Color backgroundColor, MessageTemplateSignLinePosition signLinePosition) {
    return Flexible(
      child: MessageTemplate(
        messageContent: message.content,
        messageTextStyle: messageTextStyle,
        maxWidth: maxWidth,
        backgroundColor: backgroundColor,
        title: this.title != null ? this.title : null,
        titlePrefix: this.titlePrefix != null ? this.titlePrefix : null,
        titleColor: this.titleColor != null ? this.titleColor : null,
        definition: message.isForwarded ? 'Forwarded' : null,
        definitionColor: Colors.black38,
        definitionPrefix: Ionicons.arrow_redo_outline,
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
