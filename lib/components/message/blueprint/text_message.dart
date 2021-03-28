import 'package:chapp/components/message/blueprint/message_content_template.dart';
import 'package:chapp/components/message/blueprint/message_content_type.dart';
import 'package:flutter/material.dart';

class TextMessage extends MessageContentTemplate {
  final String text;

  TextMessage({@required this.text})
      : super(contentType: MessageContentType.text);
}
