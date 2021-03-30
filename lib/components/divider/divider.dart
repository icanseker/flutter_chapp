import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final double dividerWidth;
  final double lineSize;
  final Color lineColor;
  final double dividerIndentAmount;
  final double dividerEndIndentAmount;
  final EdgeInsets dividerMarginInsets;

  final Alignment labelAlignment;
  final String label;
  final TextStyle labelTextStyle;
  final double labelMarginAmount;

  const HorizontalDivider({
    Key key,
    this.dividerWidth,
    this.lineSize = 1.0,
    this.lineColor = Colors.black12,
    this.dividerIndentAmount = 0.0,
    this.dividerEndIndentAmount = 0.0,
    this.dividerMarginInsets,
    this.labelAlignment = Alignment.center,
    this.label,
    this.labelTextStyle,
    this.labelMarginAmount = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.dividerWidth != null ? this.dividerWidth : null,
      margin: this.dividerMarginInsets != null
          ? this.dividerMarginInsets
          : EdgeInsets.zero,
      child: _createDivider(),
    );
  }

  Widget _createDivider() {
    Set<Widget> widgetSet = {};

    if (label == null)
      widgetSet.add(_createLine());
    else {
      if (labelAlignment == Alignment.center) {
        widgetSet.add(_createLine());
        widgetSet.add(_createLabelWrapper());
        widgetSet.add(_createLine());
      } else if (labelAlignment == Alignment.centerLeft) {
        widgetSet.add(_createLabelWrapper());
        widgetSet.add(_createLine());
      } else if (labelAlignment == Alignment.centerRight) {
        widgetSet.add(_createLine());
        widgetSet.add(_createLabelWrapper());
      } else if (labelAlignment == Alignment.topCenter) {
        return Column(
          children: [
            _createLabelWrapper(),
            Row(children: [_createLine()])
          ],
        );
      } else if (labelAlignment == Alignment.topLeft) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createLabelWrapper(),
            Row(children: [_createLine()])
          ],
        );
      } else if (labelAlignment == Alignment.topRight) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _createLabelWrapper(),
            Row(children: [_createLine()])
          ],
        );
      } else if (labelAlignment == Alignment.bottomCenter) {
        return Column(
          children: [
            Row(children: [_createLine()]),
            _createLabelWrapper(),
          ],
        );
      } else if (labelAlignment == Alignment.bottomLeft) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [_createLine()]),
            _createLabelWrapper(),
          ],
        );
      } else if (labelAlignment == Alignment.bottomRight) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(children: [_createLine()]),
            _createLabelWrapper(),
          ],
        );
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgetSet.toList(),
    );
  }

  Widget _createLine() {
    return Expanded(
      child: Row(
        children: [
          SizedBox(width: dividerIndentAmount),
          Expanded(
            child: Container(
              height: this.lineSize,
              color: this.lineColor,
            ),
          ),
          SizedBox(width: dividerEndIndentAmount),
        ],
      ),
    );
  }

  Widget _createLabelWrapper() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: labelMarginAmount,
        vertical: 0.0,
      ),
      child: Container(
        child: SizedBox(
          child: Text(
            this.label,
            style: this.labelTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
