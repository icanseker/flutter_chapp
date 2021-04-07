import 'package:chapp/components/conversation/appbar/settings.dart';
import 'package:chapp/components/conversation/card/settings.dart';
import 'package:chapp/components/conversation/timeline/settings.dart';
import 'package:chapp/model/theme/general_content_size.dart';
import 'package:flutter/material.dart';

class ChappTheme {

  static Image defaultAvatar;
  static Image defaultGroupAvatar;

  static Color themePrimaryColor;
  static Color chatScreenBackground;

  static String _selectedFontFamily;

  static String get fontFamily {
    return _selectedFontFamily == null ? 'Sarabun' : _selectedFontFamily;
  }

  static GeneralContentSize _selectedGeneralContentSize =
      GeneralContentSize.standard;

  static GeneralContentSize get generalContentSize {
    return _selectedGeneralContentSize == null
        ? GeneralContentSize.standard
        : _selectedGeneralContentSize;
  }

  static int expandableContentTextSizeLimit = 360;

  static void initTheme() {

    themePrimaryColor = Colors.redAccent;
    chatScreenBackground = const Color(0xFFFCFCFCFC);

    defaultAvatar = Image.asset('assets/images/user-icon.png');
    defaultGroupAvatar = Image.asset('assets/images/group-icon.png');

    ConversationCardSettings(sizeRatio: generalContentSize.sizeRatio);
    ConversationTimelineSettings(sizeRatio: generalContentSize.sizeRatio);
    ChatBarSettings(sizeRatio: generalContentSize.sizeRatio);
  }
}
