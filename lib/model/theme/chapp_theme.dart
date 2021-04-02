import 'package:flutter/material.dart';

class ChappTheme{

  static Image defaultAvatar = Image.asset('assets/images/user-icon.png');
  static Image defaultGroupAvatar = Image.asset('assets/images/group-icon.png');

  static Color chatScreenBackground = const Color(0xFFFCFCFCFC);
  static Color incomingMessageTemplateBackground = const Color(0xFFEDEDED);
  static Color outgoingMessageTemplateBackground = const Color(0xFFCDE3FF);
  static Color sendErrorOccurredMessageTemplateBackground = const Color(0xFFFFCDD2);
  static Color connectionWaitingMessageTemplateBackground = const Color(0xFFFFEBEE);
  static Color unReadMessageSignColor = Colors.lightGreen;

  static Set<Color> uniqueColorSet = {Colors.red, Colors.blueAccent};

  static bool autoSizedConversationCardTitleText = true;
  static bool autoSizedConversationChatBarTitleText = false;
}