import 'package:chapp/model/theme/font/font_template.dart';
import 'package:chapp/model/theme/general_content_size.dart';
import 'package:flutter/material.dart';

class ChappTheme {
  static Image defaultAvatar = Image.asset('assets/images/user-icon.png');
  static Image defaultGroupAvatar = Image.asset('assets/images/group-icon.png');

  // @formatter:off
  static Color themePrimaryColor = Colors.redAccent;
  static Color chatScreenBackground = const Color(0xFFFCFCFCFC);
  static Color incomingMessageTemplateBackground = const Color(0xFFEDEDED);
  static Color outgoingMessageTemplateBackground = const Color(0xFFCDE3FF);
  static Color sendErrorOccurredMessageTemplateBackground = const Color(0xFFFFCDD2);
  static Color connectionWaitingMessageTemplateBackground = const Color(0xFFFFEBEE);
  static Color unReadMessageSignColor = Colors.lightGreen;

  static Set<Color> uniqueColorSet = {Colors.red, Colors.blueAccent};
  // @formatter:on

  static bool autoSizedConversationCardTitleText = true;
  static bool autoSizedConversationChatBarTitleText = false;

  static int expandableContentTextSizeLimit = 360;

  static GeneralContentSize get generalFontSize {
    return _selectedGeneralFontSize == null
        ? GeneralContentSize.standard
        : _selectedGeneralFontSize;
  }

  static GeneralContentSize _selectedGeneralFontSize =
      GeneralContentSize.standard;

  static String get fontFamily {
    return _selectedFontFamily == null ? 'Sarabun' : _selectedFontFamily;
  }

  static String _selectedFontFamily;

  static ChappFontTemplate _fontTemplate = ChappFontTemplate(
    fontFamily: fontFamily,
    generalContentSize: generalFontSize,
  );

  // @formatter:off
  // for performance issue, we declare every text style/other related sizes needs here:
  // every time calling _fontTemplate will issue calculating the style, unnecessarily
  // for example, all timestamps widget call the timestamp style
  // // will cause calculate standardSize + this.generalContentSize.deviation each call
  static final TextStyle timelineDividerTextStyle = _fontTemplate.timelineDividerTextStyle;

  static final TextStyle incomingMessageTextStyle = _fontTemplate.incomingMessageTextStyle;
  static final TextStyle incomingMessageTimeStampTextStyle = _fontTemplate.incomingMessageTimeStampTextStyle;

  static final TextStyle outgoingMessageTextStyle = _fontTemplate.outgoingMessageTextStyle;
  static final TextStyle outgoingMessageTimeStampTextStyle = _fontTemplate.outgoingMessageTimeStampTextStyle;
  static final double outgoingMessageLineIconSize = outgoingMessageTextStyle.fontSize - 3.0;

  static final TextStyle conversationCardTitleTextStyle = _fontTemplate.conversationCardTitleTextStyle;
  static final double conversationCardTitleIconSize = conversationCardTitleTextStyle.fontSize + 2.0;
  static final TextStyle conversationCardUnreadCountTextStyle = _fontTemplate.conversationCardUnreadCountTextStyle;
  static final double conversationCardUnreadCountWrapperSize = conversationCardTitleTextStyle.fontSize + 1.0;
  static final TextStyle conversationCardLastMessageTextStyle = _fontTemplate.conversationCardLastMessageTextStyle;
  static final double conversationCardLastMessageIconSize = conversationCardLastMessageTextStyle.fontSize;
  static final TextStyle conversationCardLastActivityTextStyle = _fontTemplate.conversationCardLastActivityTextStyle;
  static final double conversationCardAvatarRadius = conversationCardTitleTextStyle.fontSize * 1.6;
  static final double conversationCardAvatarBadgeSize = conversationCardTitleTextStyle.fontSize / 1.8;
// @formatter:on
}
