import 'package:chapp/components/empty_widget.dart';
import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final double thickness;
  final Color color;
  final double leftIndent;
  final double rightIndent;
  final EdgeInsets marginInsets;

  final Widget label;
  final Alignment labelAlignment;
  final EdgeInsets labelMarginInsets;

  const HorizontalDivider({
    this.thickness,
    this.color,
    this.leftIndent,
    this.rightIndent,
    this.marginInsets,
    this.label,
    this.labelAlignment,
    this.labelMarginInsets,
  });

  @override
  Widget build(BuildContext context) {
    final Widget lineWidget = Expanded(
      child: Container(
        height: thickness == null || thickness < 0 ? 1.0 : thickness,
        color: color ?? Colors.black,
      ),
    );
    final Widget labelWidgetWrapper = label == null
        ? EmptyWidget()
        : labelMarginInsets == null
            ? label
            : Container(margin: labelMarginInsets, child: label);

    Widget lineWidgetWrapper;

    if (label != null) {
      Alignment labelPosition = labelAlignment ?? Alignment.center;

      if (labelPosition == Alignment.center) {
        lineWidgetWrapper = Row(children: [
          lineWidget,
          labelWidgetWrapper,
          lineWidget,
        ]);
      } else if (labelPosition == Alignment.centerLeft) {
        lineWidgetWrapper = Row(children: [
          labelWidgetWrapper,
          lineWidget,
        ]);
      } else if (labelPosition == Alignment.centerRight) {
        lineWidgetWrapper = Row(children: [
          lineWidget,
          labelWidgetWrapper,
        ]);
      } else if (labelPosition == Alignment.topCenter) {
        lineWidgetWrapper = Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 25.0),
                Flexible(child: labelWidgetWrapper),
                SizedBox(width: 25.0),
              ],
            ),
            Row(children: [lineWidget]),
          ],
        );
      } else if (labelPosition == Alignment.topLeft) {
        lineWidgetWrapper = Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: labelWidgetWrapper),
                SizedBox(width: 25.0),
              ],
            ),
            Row(children: [lineWidget]),
          ],
        );
      } else if (labelPosition == Alignment.topRight) {
        lineWidgetWrapper = Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 25.0),
                Flexible(child: labelWidgetWrapper),
              ],
            ),
            Row(children: [lineWidget]),
          ],
        );
      } else if (labelPosition == Alignment.bottomCenter) {
        lineWidgetWrapper = Column(
          children: [
            Row(children: [lineWidget]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 25.0),
                Flexible(child: labelWidgetWrapper),
                SizedBox(width: 25.0),
              ],
            ),
          ],
        );
      } else if (labelPosition == Alignment.bottomLeft) {
        lineWidgetWrapper = Column(
          children: [
            Row(children: [lineWidget]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: labelWidgetWrapper),
                SizedBox(width: 25.0),
              ],
            ),
          ],
        );
      } else if (labelPosition == Alignment.bottomRight) {
        lineWidgetWrapper = Column(
          children: [
            Row(children: [lineWidget]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 25.0),
                Flexible(child: labelWidgetWrapper),
              ],
            ),
          ],
        );
      }
    }

    return Container(
      margin: marginInsets ?? EdgeInsets.zero,
      child: Row(
        children: [
          SizedBox(width: leftIndent ?? 0.0),
          lineWidgetWrapper != null
              ? Expanded(child: lineWidgetWrapper)
              : lineWidget,
          SizedBox(width: rightIndent ?? 0.0),
        ],
      ),
    );
  }
}
