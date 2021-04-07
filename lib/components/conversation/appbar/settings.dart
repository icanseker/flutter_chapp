import 'package:chapp/components/component_settings.dart';
import 'package:chapp/helper/color.dart';
import 'package:flutter/material.dart';

class ChatBarSettings extends ComponentSettings {
  static double height = 6.0;
  static Color backgroundColor =
      ColorHelper.createMaterialColor(Color(0xFFFCFCFCFC));

  static double backBtnIconSize = 1.8;
  static double backBtnContainerInnerPadding = 8;
  static double backBtnContainerWidth =
      backBtnIconSize + backBtnContainerInnerPadding * 2;
  static Color backBtnIconColor = Colors.black54;

  static double avatarRadius = 2.5;
  static double avatarBorderSize = 0.1;
  static Color avatarBorderColor = Colors.black54;

  static double avatarBadgeSize = 1;
  static double avatarBadgeBorderSize = 0.1;
  static Color avatarBadgeBorderColor = Colors.white;

  static double titleFontSize = 1.8;
  static bool autoSizedTitleText = false;

  static double subtitleFontSize = 1.3;

  static double actionBtnIconSize = 2.0;
  static double actionBtnContainerInnerPadding = 8;
  static double actionBtnContainerWidth =
      actionBtnIconSize + actionBtnContainerInnerPadding * 2;
  static Color actionBtnIconColor = Colors.black54;

  static Color bottomBorderColor = Colors.black12;

  static double menuBtnIconSize = 1.8;
  static double menuBtnContainerInnerPadding = 8;
  static double menuBtnContainerWidth =
      actionBtnIconSize + actionBtnContainerInnerPadding * 2;

  static bool autoSizedTitleFontSize = false;

  ChatBarSettings({@required double sizeRatio}) : super(sizeRatio: sizeRatio) {
    height *= super.sizeRatioAmount;

    backBtnIconSize *= super.sizeRatioAmount;
    backBtnContainerWidth = backBtnIconSize + backBtnContainerInnerPadding * 2;

    avatarRadius *= super.sizeRatioAmount;
    avatarBorderSize *= super.sizeRatioAmount;

    avatarBadgeSize *= super.sizeRatioAmount;
    avatarBadgeBorderSize *= super.sizeRatioAmount;

    titleFontSize *= super.sizeRatioAmount;
    subtitleFontSize *= super.sizeRatioAmount;

    actionBtnIconSize *= super.sizeRatioAmount;
    actionBtnContainerWidth =
        actionBtnIconSize + actionBtnContainerInnerPadding * 2;

    menuBtnIconSize *= super.sizeRatioAmount;
    menuBtnContainerWidth = menuBtnIconSize + menuBtnContainerInnerPadding * 2;
  }
}
