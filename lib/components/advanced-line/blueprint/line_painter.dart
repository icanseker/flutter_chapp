import 'package:chapp/components/advanced-line/blueprint/line/circled_line.dart';
import 'package:chapp/components/advanced-line/blueprint/line/dashed_line.dart';
import 'package:chapp/components/advanced-line/blueprint/line/dotted_line.dart';
import 'package:chapp/components/advanced-line/blueprint/line/line.dart';
import 'package:chapp/components/advanced-line/blueprint/line/ovaled_line.dart';
import 'package:chapp/components/advanced-line/blueprint/line/solid_line.dart';
import 'package:chapp/components/advanced-line/blueprint/line/zigzag_line.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final Line line;
  final Paint paintDef;
  final Gradient gradient;

  const LinePainter({@required this.line, this.paintDef, this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    if (size == null || paintDef == null || paintDef.strokeWidth < 0.0) return;

    double width = size.width; // always axis is horizontal here

    switch (line.runtimeType) {
      case DottedLine:
        {
          if (paintDef.strokeWidth <= 0.0) paintDef.strokeWidth = 1.0;
          if (paintDef.strokeWidth >= width) return;
          if ((line as DottedLine).gapSize >= width) return;

          break;
        }
      case DashedLine:
        {
          double dashSize = (line as DashedLine).dashSize;
          if (dashSize <= 0.0 || dashSize >= width) return;

          double gapSize = (line as DashedLine).gapSize;
          if (gapSize >= width || gapSize <= 0.0) return;

          break;
        }
      case ZigzagLine:
        {
          double angle = (line as ZigzagLine).angle;

          if (angle <= 0.0 || angle >= 180)
            return SolidLine().draw(canvas, width, paintDef);

          break;
        }
      case CircledLine:
        {
          double diameter = (line as CircledLine).diameter;
          if (diameter <= 0.0) return;
          if (diameter >= width)
            return SolidLine().draw(canvas, width, paintDef);

          double gapSize = (line as CircledLine).gapSize;
          if (gapSize >= width) return;
          if (gapSize <= 0) return SolidLine().draw(canvas, width, paintDef);
          break;
        }
      case OvaledLine:
        {
          break;
        }
      default:
        break;
    }

    // set gradient
    if (gradient != null) {
      switch (gradient.runtimeType) {
        case LinearGradient:
        case SweepGradient:
          {
            paintDef.shader = gradient.createShader(
              Rect.fromPoints(
                Offset.zero,
                Offset(width, 0.0),
              ),
            );
            break;
          }
        case RadialGradient:
          {
            double xMidPoint = width / 2;
            double yMidPoint;

            // if you need calculate mid point of y axis
            if (line is ZigzagLine)
              yMidPoint = (line as ZigzagLine).depth / 2;
            else
              yMidPoint = paintDef.strokeWidth / 2;

            paintDef.shader = gradient.createShader(
              Rect.fromCircle(
                center: Offset(xMidPoint, yMidPoint),
                radius: xMidPoint,
              ),
            );
            break;
          }
      }
    }

    line.draw(canvas, width, paintDef);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
