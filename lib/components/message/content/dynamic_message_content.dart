import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/message/blueprint/message_content_template.dart';
import 'package:chapp/components/message/blueprint/text_message.dart';
import 'package:chapp/components/message/content/text/expandable_text_content.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:flutter/material.dart';

class DynamicMessageContent extends StatelessWidget {
  final MessageContentTemplate messageContent;
  final TextStyle messageTextStyle;

  const DynamicMessageContent(
      {Key key, @required this.messageContent, @required this.messageTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (messageContent.runtimeType) {
      case TextMessage:
        {
          String text = (messageContent as TextMessage).text;
          return text == null ||
                  text.length < ChappTheme.expandableContentTextSizeLimit
              ? Text(text, style: messageTextStyle)
              : ExpandableTextContent(
                  text: text,
                  textStyle: this.messageTextStyle,
                  bothWay: false,
                  expandText: 'Show all',
                );
        }
      default:
        return EmptyWidget();
    }
  }
}
