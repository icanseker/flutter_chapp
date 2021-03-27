import 'package:chapp/components/empty_widget.dart';
import 'package:flutter/material.dart';

class ExpandableTextContent extends StatefulWidget {
  final String text;
  final double fontSize;
  final int maxLines;
  final bool bothWay;
  final String expandText;
  final String collapseText;

  const ExpandableTextContent({
    Key key,
    @required this.text,
    this.fontSize = 16,
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
    return Column(
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.fontSize,
          ),
          maxLines: _isExpanded ? null : widget.maxLines,
          overflow: _isExpanded ? null : TextOverflow.ellipsis,
        ),
        widget.bothWay
            ? TextButton(
                onPressed: () => _switchState(),
                child:
                    Text(_isExpanded ? widget.collapseText : widget.expandText),
              )
            : _isExpanded
                ? EmptyWidget()
                : TextButton(
                    onPressed: () => _switchState(),
                    child: Text(widget.expandText),
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
