import 'package:chapp/components/conversation/timeline/settings.dart';
import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/message/blueprint/message_content_template.dart';
import 'package:chapp/components/message/blueprint/message_template_sign_line_position.dart';
import 'package:chapp/components/message/content/dynamic_message_content.dart';
import 'package:chapp/helper/color.dart';
import 'package:flutter/material.dart';

class MessageTemplate extends StatelessWidget {
  final double radiusAmount = 12.0;

  final MessageContentTemplate messageContent;
  final TextStyle messageTextStyle;

  final bool activateTopLeftBorderRadius;
  final bool activateTopRightBorderRadius;
  final bool activateBottomLeftBorderRadius;
  final bool activateBottomRightBorderRadius;

  final Color backgroundColor;
  final double maxWidth;

  final String title;
  final Color titleColor;
  final IconData titlePrefix;

  final String definition;
  final Color definitionColor;
  final IconData definitionPrefix;

  final MessageTemplateSignLinePosition signLinePosition;
  final Color signLineColor;

  const MessageTemplate({
    Key key,
    @required this.messageContent,
    @required this.messageTextStyle,
    this.activateTopLeftBorderRadius = false,
    this.activateTopRightBorderRadius = false,
    this.activateBottomLeftBorderRadius = false,
    this.activateBottomRightBorderRadius = false,
    this.backgroundColor,
    this.maxWidth = double.maxFinite,
    this.title,
    this.titleColor = Colors.black,
    this.titlePrefix,
    this.definition,
    this.definitionColor = Colors.black38,
    this.definitionPrefix,
    this.signLinePosition = MessageTemplateSignLinePosition.left,
    this.signLineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _calculateOuterEdgeInsets(),
      constraints: BoxConstraints(
        maxWidth: this.maxWidth,
      ),
      decoration: BoxDecoration(
        color: ColorHelper.createMaterialColor(
          this.backgroundColor == null ? Colors.white : this.backgroundColor,
        ),
        borderRadius: BorderRadius.only(
          topLeft:
              Radius.circular(activateTopLeftBorderRadius ? radiusAmount : 0),
          topRight:
              Radius.circular(activateTopRightBorderRadius ? radiusAmount : 0),
          bottomLeft: Radius.circular(
              activateBottomLeftBorderRadius ? radiusAmount : 0),
          bottomRight: Radius.circular(
              activateBottomRightBorderRadius ? radiusAmount : 0),
        ),
      ),
      child: Container(
        padding: _calculateInnerEdgeInsets(),
        decoration: this.signLineColor != null
            ? BoxDecoration(
                border: _calculateSignLine(),
              )
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createTitleWidget(),
            this.title != null ? SizedBox(height: 6) : EmptyWidget(),
            _createDefinitionWidget(),
            this.definition != null ? SizedBox(height: 2) : EmptyWidget(),
            DynamicMessageContent(
              messageContent: messageContent,
              messageTextStyle: this.messageTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _createTitleWidget() {
    return this.title != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              this.titlePrefix != null
                  ? Icon(
                      this.titlePrefix,
                      size: ConversationTimelineSettings.messageTitlePrefixSize,
                      color: this.titleColor,
                    )
                  : EmptyWidget(),
              this.titlePrefix != null ? SizedBox(width: 4) : EmptyWidget(),
              Flexible(
                child: Text(
                  this.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: ConversationTimelineSettings.messageTitleFontSize,
                    color: this.titleColor,
                  ),
                ),
              ),
            ],
          )
        : EmptyWidget();
  }

  Widget _createDefinitionWidget() {
    return this.definition != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              this.definitionPrefix != null
                  ? Icon(
                      this.definitionPrefix,
                      size: ConversationTimelineSettings
                          .messageDefinitionPrefixSize,
                      color: this.definitionColor,
                    )
                  : EmptyWidget(),
              this.definitionPrefix != null
                  ? SizedBox(width: 4)
                  : EmptyWidget(),
              Flexible(
                child: Text(
                  this.definition,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize:
                        ConversationTimelineSettings.messageDefinitionFontSize,
                    color: this.definitionColor,
                  ),
                ),
              ),
            ],
          )
        : EmptyWidget();
  }

  EdgeInsets _calculateOuterEdgeInsets() {
    if (signLineColor == null)
      return EdgeInsets.zero;
    else {
      switch (this.signLinePosition) {
        case MessageTemplateSignLinePosition.left:
          {
            return EdgeInsets.only(
              top: activateTopLeftBorderRadius ? radiusAmount : 0,
              bottom: activateBottomLeftBorderRadius ? radiusAmount : 0,
            );
          }
        case MessageTemplateSignLinePosition.right:
          {
            return EdgeInsets.only(
              top: activateTopRightBorderRadius ? radiusAmount : 0,
              bottom: activateBottomRightBorderRadius ? radiusAmount : 0,
            );
          }
        default:
          return EdgeInsets.zero;
      }
    }
  }

  EdgeInsets _calculateInnerEdgeInsets() {
    if (signLineColor == null)
      return EdgeInsets.all(12.0);
    else {
      switch (this.signLinePosition) {
        case MessageTemplateSignLinePosition.left:
          {
            return EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: activateTopLeftBorderRadius ? 0 : radiusAmount,
              bottom: activateBottomLeftBorderRadius ? 0 : radiusAmount,
            );
          }
        case MessageTemplateSignLinePosition.right:
          {
            return EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: activateTopRightBorderRadius ? 0 : radiusAmount,
              bottom: activateBottomRightBorderRadius ? 0 : radiusAmount,
            );
          }
        default:
          return EdgeInsets.all(12.0);
      }
    }
  }

  Border _calculateSignLine() {
    if (signLineColor == null)
      return null;
    else {
      switch (this.signLinePosition) {
        case MessageTemplateSignLinePosition.left:
          {
            return Border(
                left: BorderSide(color: this.signLineColor, width: 2));
          }
        case MessageTemplateSignLinePosition.right:
          {
            return Border(
              right: BorderSide(color: this.signLineColor, width: 2),
            );
          }
        default:
          return null;
      }
    }
  }
}
