import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/message/blueprint/message_content_type.dart';
import 'package:chapp/components/message/blueprint/message_content_template.dart';
import 'package:chapp/components/message/blueprint/text_message.dart';
import 'package:chapp/helper/color.dart';
import 'package:flutter/material.dart';

class IncomingMessageTemplate extends StatelessWidget {
  final MessageContentTemplate message;
  final Color backgroundColor;
  final double maxWidth;
  final Color signColor;
  final String title;
  final Color titleColor;
  final IconData titlePrefix;

  const IncomingMessageTemplate({
    Key key,
    @required this.message,
    this.backgroundColor,
    this.maxWidth = double.maxFinite,
    this.title,
    this.titleColor,
    this.titlePrefix,
    this.signColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      constraints: BoxConstraints(
        maxWidth: this.maxWidth,
      ),
      decoration: BoxDecoration(
        color: ColorHelper.createMaterialColor(
          this.backgroundColor == null ? Colors.white : this.backgroundColor,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.0),
          topLeft: Radius.circular(0),
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        decoration: this.signColor != null
            ? BoxDecoration(
                border: Border(
                  left: BorderSide(color: this.signColor, width: 2),
                ),
              )
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            this.title != null
                ? Row(
                    children: [
                      this.titlePrefix != null
                          ? Container(
                              width: 24,
                              height: 24,
                              child: Icon(
                                this.titlePrefix,
                                size: 18,
                                color: titleColor,
                              ),
                            )
                          : EmptyWidget(),
                      Expanded(
                        child: Text(
                          this.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: this.titleColor,
                          ),
                        ),
                      )
                    ],
                  )
                : EmptyWidget(),
            this.title != null ? SizedBox(height: 4) : EmptyWidget(),
            message.contentType == MessageContentType.text
                ? Text(
                    (message as TextMessage).text,
                    style: TextStyle(fontSize: 16),
                  )
                : EmptyWidget(),
          ],
        ),
      ),
    );
  }
}
