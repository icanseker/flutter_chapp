import 'package:chapp/components/advanced-line/blueprint/line/line.dart';
import 'package:flutter/material.dart';

class SolidLine extends Line {
  @override
  void draw(
    Canvas canvas,
    double width,
    Paint paint,
  ) {
    double strokeVerticalOverflow, strokeHorizontalOverflow;

    strokeVerticalOverflow = paint.strokeWidth / 2;
    strokeHorizontalOverflow =
        paint.strokeCap == StrokeCap.butt ? 0.0 : strokeVerticalOverflow;

    canvas.drawLine(
      Offset(
        strokeHorizontalOverflow,
        strokeVerticalOverflow,
      ),
      Offset(
        width - strokeHorizontalOverflow,
        strokeVerticalOverflow,
      ),
      paint,
    );

    Path shadowPath = Path();
    shadowPath.addRect(
      Rect.fromPoints(
        Offset.zero,
        Offset(
          width,
          paint.strokeWidth,
        ),
      ),
    );

    canvas.drawShadow(shadowPath, Colors.grey.withAlpha(50), 4.0, false);
  }
}
