import 'package:chapp/components/advanced-line/blueprint/line/circled_line.dart';
import 'package:chapp/components/advanced-line/blueprint/line/line.dart';
import 'package:chapp/components/advanced-line/blueprint/line/ovaled_line.dart';
import 'package:chapp/components/advanced-line/blueprint/line/zigzag_line.dart';
import 'package:chapp/components/advanced-line/blueprint/line_painter.dart';
import 'package:flutter/material.dart';

class AdvancedLine extends StatelessWidget {
  final Axis direction;
  final Line type;
  final Paint paintDef;
  final Gradient gradient;

  const AdvancedLine({
    Key key,
    @required this.direction,
    @required this.type,
    this.paintDef,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // line painter, always rendering horizontal line
    // if requested axis is vertical
    // send horizontal line with 90 degree rotated

    Paint paint = this.paintDef ?? Paint();
    double yDepth = paint.strokeWidth;

    switch (type.runtimeType) {
      case CircledLine:
        {
          yDepth = (type as CircledLine).diameter +
              (paint.style == PaintingStyle.stroke ? paint.strokeWidth : 0.0);
          break;
        }
      case OvaledLine:
        {
          yDepth = (type as OvaledLine).ySize +
              (paint.style == PaintingStyle.stroke ? paint.strokeWidth : 0.0);
          break;
        }
      case ZigzagLine:
        {
          yDepth = (type as ZigzagLine).depth;
          break;
        }
    }

    Row lineWrapper = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: yDepth,
            child: CustomPaint(
              painter: LinePainter(
                line: type,
                paintDef: paint,
                gradient: gradient,
              ),
            ),
          ),
        ),
      ],
    );

    if (direction == Axis.horizontal)
      return lineWrapper;
    else
      return new RotatedBox(
        quarterTurns: 1,
        child: lineWrapper,
      );
  }
}
