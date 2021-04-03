import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/message/blueprint/message_content_template.dart';
import 'package:chapp/components/message/blueprint/text_message.dart';
import 'package:chapp/components/message/content/text/expandable_text_content.dart';
import 'package:chapp/components/message/content/text/text_content.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:flutter/material.dart';

class DynamicMessageContent extends StatelessWidget {
  final MessageContentTemplate messageContent;

  const DynamicMessageContent({Key key, @required this.messageContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (messageContent.runtimeType) {
      case TextMessage:
        {
          String text = (messageContent as TextMessage).text;
          return text == null ||
                  text.length < ChappTheme.expandableContentTextSizeLimit
              ? TextContent(
                  text: text,
                  fontSize: 16,
                )
              : ExpandableTextContent(
                  text: text,
                  fontSize: 16,
                  bothWay: false,
                  expandText: 'Show all',
                );
        }
      default:
        return EmptyWidget();
    }
  }
}
