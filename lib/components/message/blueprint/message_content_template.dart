import 'package:chapp/components/message/blueprint/message_content_type.dart';

abstract class MessageContentTemplate {
  final MessageContentType contentType;

  MessageContentTemplate({this.contentType});
}
