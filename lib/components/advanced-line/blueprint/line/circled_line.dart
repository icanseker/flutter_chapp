import 'package:chapp/components/advanced-line/blueprint/line/line.dart';
import 'package:flutter/material.dart';

class CircledLine extends Line {
  final double diameter;
  final double gapSize;

  const CircledLine({
    this.diameter = 10.0,
    this.gapSize = 10.0,
  });

  @override
  void draw(
    Canvas canvas,
    double width,
    Paint paint,
  ) {
    List<Offset> points = [];
    double patternWidth, surplusWidth;
    double xPosition = 0.0, strokeVerticalOverflow;

    double pointSize = diameter +
        (paint.style == PaintingStyle.stroke ? paint.strokeWidth : 0.0);
    strokeVerticalOverflow = pointSize / 2;

    patternWidth = pointSize + gapSize;
    surplusWidth = (width + gapSize) % patternWidth;

    xPosition = strokeVerticalOverflow + surplusWidth / 2;

    // position + pointSize <= width + pointSize
    do {
      points.add(Offset(
        xPosition,
        strokeVerticalOverflow,
      ));
    } while ((xPosition += patternWidth) <= width);

    double radius = diameter / 2;
    points.forEach((point) {
      canvas.drawCircle(point, radius, paint);
    });
  }
}
