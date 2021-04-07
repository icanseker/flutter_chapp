import 'package:chapp/components/component_settings.dart';
import 'package:flutter/material.dart';

class ConversationTimelineSettings extends ComponentSettings {
  static double messageFontSize = 1.6;
  static double messageTimeStampFontSize = 1.4;
  static double messageStatusIconSize = 1.3;

  static double timelineDividerLabelFontSize = 1.5;
  static Color timelineDividerLineColor = Colors.grey;

  static double messageDefinitionPrefixSize = 1.4;
  static double messageDefinitionFontSize = 1.2;

  static double messageTitlePrefixSize = 1.6;
  static double messageTitleFontSize = 1.4;

  static double expandableMsgTemplateSwitchBtnFontSize = 1.4;

  static Color incomingMessageTemplateBackground = const Color(0xFFEDEDED);
  static Color outgoingMessageTemplateBackground = const Color(0xFFCDE3FF);
  static Color sendErrorOccurredMessageTemplateBackground = const Color(0xFFFFCDD2);
  static Color connectionWaitingMessageTemplateBackground = const Color(0xFFFFEBEE);
  static Color unReadMessageSignColor = Colors.lightGreen;

  ConversationTimelineSettings({@required double sizeRatio})
      : super(sizeRatio: sizeRatio) {
    messageFontSize *= super.sizeRatioAmount;
    messageTimeStampFontSize *= super.sizeRatioAmount;
    messageStatusIconSize *= super.sizeRatioAmount;

    timelineDividerLabelFontSize *= super.sizeRatioAmount;

    messageDefinitionPrefixSize *= super.sizeRatioAmount;
    messageDefinitionFontSize *= super.sizeRatioAmount;

    messageTitlePrefixSize *= super.sizeRatioAmount;
    messageTitleFontSize *= super.sizeRatioAmount;

    expandableMsgTemplateSwitchBtnFontSize *= super.sizeRatioAmount;
  }
}
