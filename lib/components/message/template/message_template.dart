import 'package:chapp/components/message/blueprint/message_content_template.dart';
import 'package:flutter/material.dart';

abstract class MessageTemplate extends StatelessWidget {
  final MessageContentTemplate messageContent;
  final Color backgroundColor;
  final double maxWidth;
  final Color signColor;
  final String title;
  final Color titleColor;
  final IconData titlePrefix;

  const MessageTemplate({
    Key key,
    @required this.messageContent,
    this.backgroundColor,
    this.maxWidth = double.maxFinite,
    this.title,
    this.titleColor,
    this.titlePrefix,
    this.signColor,
  }) : super(key: key);
}
