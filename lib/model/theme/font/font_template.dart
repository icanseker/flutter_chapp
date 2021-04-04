import 'package:chapp/model/theme/general_content_size.dart';
import 'package:flutter/material.dart';

class ChappFontTemplate {
  final String fontFamily;
  final GeneralContentSize generalContentSize;
  final double standardSize;

  TextStyle _customIncomingMessageTextStyle;
  TextStyle _customIncomingMessageTimeStampTextStyle;

  TextStyle _customOutgoingMessageTextStyle;
  TextStyle _customOutgoingMessageTimeStampTextStyle;

  TextStyle _customTimelineDividerTextStyle;

  TextStyle _customConversationCardTitleTextStyle;
  TextStyle _customConversationCardUnreadCountTextStyle;
  TextStyle _customConversationCardLastMessageTextStyle;
  TextStyle _customConversationCardLastActivityTextStyle;

  ChappFontTemplate({
    @required this.fontFamily,
    @required this.generalContentSize,
    this.standardSize = 16,
    TextStyle customIncomingMessageTextStyle,
    TextStyle customIncomingMessageTimeStampTextStyle,
    TextStyle customOutgoingMessageTextStyle,
    TextStyle customOutgoingMessageTimeStampTextStyle,
    TextStyle customTimelineDividerTextStyle,
    TextStyle customConversationCardTitleTextStyle,
    TextStyle customConversationCardUnreadCountTextStyle,
    TextStyle customConversationCardLastMessageTextStyle,
    TextStyle customConversationCardLastActivityTextStyle,
  }) {
    _customIncomingMessageTextStyle = customIncomingMessageTextStyle;
    _customIncomingMessageTimeStampTextStyle =
        customIncomingMessageTimeStampTextStyle;

    _customOutgoingMessageTextStyle = customOutgoingMessageTextStyle;
    _customOutgoingMessageTimeStampTextStyle =
        customOutgoingMessageTimeStampTextStyle;

    _customTimelineDividerTextStyle = customTimelineDividerTextStyle;

    _customConversationCardTitleTextStyle =
        customConversationCardTitleTextStyle;
    _customConversationCardUnreadCountTextStyle =
        customConversationCardUnreadCountTextStyle;
    _customConversationCardLastMessageTextStyle =
        customConversationCardLastMessageTextStyle;
    _customConversationCardLastActivityTextStyle =
        customConversationCardLastActivityTextStyle;
  }

  TextStyle get incomingMessageTextStyle {
    return _customIncomingMessageTextStyle == null
        ? TextStyle(fontSize: standardSize + this.generalContentSize.deviation)
        : _customIncomingMessageTextStyle;
  }

  TextStyle get incomingMessageTimeStampTextStyle {
    return _customIncomingMessageTimeStampTextStyle == null
        ? TextStyle(
            fontSize: incomingMessageTextStyle.fontSize - 2.0,
          )
        : _customIncomingMessageTimeStampTextStyle;
  }

  TextStyle get outgoingMessageTextStyle {
    return _customOutgoingMessageTextStyle == null
        ? TextStyle(fontSize: standardSize + this.generalContentSize.deviation)
        : _customOutgoingMessageTextStyle;
  }

  TextStyle get outgoingMessageTimeStampTextStyle {
    return _customOutgoingMessageTimeStampTextStyle == null
        ? TextStyle(
            fontSize: outgoingMessageTextStyle.fontSize - 2.0,
          )
        : _customOutgoingMessageTimeStampTextStyle;
  }

  TextStyle get timelineDividerTextStyle {
    return _customTimelineDividerTextStyle == null
        ? TextStyle(
            fontSize: standardSize + (this.generalContentSize.deviation / 2),
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          )
        : _customTimelineDividerTextStyle;
  }

  TextStyle get conversationCardTitleTextStyle {
    return _customConversationCardTitleTextStyle == null
        ? TextStyle(
            fontSize: standardSize + this.generalContentSize.deviation + 2.0,
            fontWeight: FontWeight.w600,
          )
        : _customConversationCardTitleTextStyle;
  }

  TextStyle get conversationCardUnreadCountTextStyle {
    return _customConversationCardUnreadCountTextStyle == null
        ? TextStyle(
            color: Colors.white,
            fontSize: conversationCardTitleTextStyle.fontSize - 2.0)
        : _customConversationCardUnreadCountTextStyle;
  }

  TextStyle get conversationCardLastMessageTextStyle {
    return _customConversationCardLastMessageTextStyle == null
        ? TextStyle(
            fontSize: conversationCardTitleTextStyle.fontSize - 2.0,
            fontWeight: FontWeight.w400,
          )
        : _customConversationCardLastMessageTextStyle;
  }

  TextStyle get conversationCardLastActivityTextStyle {
    return _customConversationCardLastActivityTextStyle == null
        ? TextStyle(
            fontSize: conversationCardTitleTextStyle.fontSize - 4.0,
            fontWeight: FontWeight.w400,
          )
        : _customConversationCardLastActivityTextStyle;
  }
}
