import 'package:chapp/components/message/blueprint/message_content_type.dart';
import 'package:chapp/components/message/blueprint/message_content_template.dart';

class TextMessage extends MessageContentTemplate {
  final String text;

  TextMessage({this.text}) : super(contentType: MessageContentType.text);
}
