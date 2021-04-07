import 'package:chapp/components/conversation/appbar/settings.dart';
import 'package:chapp/components/conversation/card/settings.dart';
import 'package:chapp/components/conversation/timeline/settings.dart';
import 'package:chapp/model/theme/general_content_size.dart';
import 'package:flutter/material.dart';

class ChappTheme {
  // @formatter:off
  static Image defaultAvatar = Image.asset('assets/images/user-icon.png');
  static Image defaultGroupAvatar = Image.asset('assets/images/group-icon.png');

  static Color themePrimaryColor = Colors.redAccent;
  static Color chatScreenBackground = const Color(0xFFFCFCFCFC);

  static Set<Color> uniqueColorSet = {Colors.red, Colors.blueAccent};
  // @formatter:on

  static String _selectedFontFamily;

  static String get fontFamily {
    return _selectedFontFamily == null ? 'Sarabun' : _selectedFontFamily;
  }

  static GeneralContentSize _selectedGeneralContentSize =
      GeneralContentSize.x6_large;

  static GeneralContentSize get generalContentSize {
    return _selectedGeneralContentSize == null
        ? GeneralContentSize.standard
        : _selectedGeneralContentSize;
  }

  static int expandableContentTextSizeLimit = 360;

  static void initTheme() {
    ConversationCardSettings(sizeRatio: generalContentSize.sizeRatio);
    ConversationTimelineSettings(sizeRatio: generalContentSize.sizeRatio);
    ChatBarSettings(sizeRatio: generalContentSize.sizeRatio);
  }

  static bool autoSizedConversationChatBarTitleText = false;
}
