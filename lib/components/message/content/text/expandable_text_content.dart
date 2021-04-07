import 'package:chapp/components/conversation/timeline/settings.dart';
import 'package:chapp/components/empty_widget.dart';
import 'package:flutter/material.dart';

class ExpandableTextContent extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final int maxLines;
  final bool bothWay;
  final String expandText;
  final String collapseText;

  const ExpandableTextContent({
    Key key,
    @required this.text,
    @required this.textStyle,
    this.maxLines = 5,
    this.bothWay = false,
    this.expandText = 'Read more',
    this.collapseText = 'Read less',
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExpandableTextContentState();
  }
}

class _ExpandableTextContentState extends State<ExpandableTextContent> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    TextStyle switchBtnTextStyle = TextStyle(
      fontSize:
          ConversationTimelineSettings.expandableMsgTemplateSwitchBtnFontSize,
    );

    return Column(
      children: [
        Text(
          widget.text,
          style: widget.textStyle,
          maxLines: _isExpanded ? null : widget.maxLines,
          overflow: _isExpanded ? null : TextOverflow.ellipsis,
        ),
        widget.bothWay
            ? TextButton(
                onPressed: () => _switchState(),
                child: Text(
                  _isExpanded ? widget.collapseText : widget.expandText,
                  style: switchBtnTextStyle,
                ),
              )
            : _isExpanded
                ? EmptyWidget()
                : TextButton(
                    onPressed: () => _switchState(),
                    child: Text(widget.expandText, style: switchBtnTextStyle),
                  ),
      ],
    );
  }

  void _switchState() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
