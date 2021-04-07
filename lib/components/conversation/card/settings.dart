import 'package:chapp/components/component_settings.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ConversationCardSettings extends ComponentSettings {
  static double titleFontSize = 1.8;
  static IconData titlePrefix = Ionicons.people_circle_outline;
  static double titlePrefixSize = 2.0;
  static Color titlePrefixColor = Colors.black54;
  static bool autoSizedTitleText = true;

  static double unreadCountWrapperSize = 1.7;
  static double unreadCountFontSize = 1.6;
  static Color unreadCountFontColor = Colors.white;
  static Color unreadCountWrapperColor = ChappTheme.themePrimaryColor;

  static double avatarRadius = 2.9;
  static double avatarBorderSize = 0.1;
  static Color avatarBorderColor = Colors.black54;

  static double avatarBadgeSize = 1;
  static double avatarBadgeBorderSize = 0.1;
  static Color avatarBadgeBorderColor = Colors.white;

  static double lastActivityTimeStampFontSize = 1.4;
  static Color lastActivityTimeStampFontColor = Colors.black54;

  static double senderTitleFontSize = 1.2;
  static Color senderTitleFontColor = Colors.black87;

  static double lastMessageFontSize = 1.6;
  static double lastMessageIconSize = 1.6;

  ConversationCardSettings({@required double sizeRatio})
      : super(sizeRatio: sizeRatio) {
    titleFontSize *= super.sizeRatioAmount;
    titlePrefixSize *= super.sizeRatioAmount;

    unreadCountWrapperSize *= super.sizeRatioAmount;
    unreadCountFontSize *= super.sizeRatioAmount;

    avatarRadius *= super.sizeRatioAmount;
    avatarBorderSize *= super.sizeRatioAmount;

    avatarBadgeSize *= super.sizeRatioAmount;
    avatarBadgeBorderSize *= super.sizeRatioAmount;

    lastActivityTimeStampFontSize *= super.sizeRatioAmount;

    senderTitleFontSize *= super.sizeRatioAmount;
    lastMessageFontSize *= super.sizeRatioAmount;
    lastMessageIconSize *= super.sizeRatioAmount;
  }
}
