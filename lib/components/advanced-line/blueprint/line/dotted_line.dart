import 'dart:ui';

import 'package:chapp/components/advanced-line/blueprint/line/line.dart';
import 'package:flutter/material.dart';

class DottedLine extends Line {
  final double gapSize;

  const DottedLine({this.gapSize = 10.0});

  @override
  void draw(
    Canvas canvas,
    double width,
    Paint paint,
  ) {
    double pointSize, patternWidth, surplusWidth;
    double xPosition, strokeVerticalOverflow;

    pointSize = paint.strokeWidth;
    strokeVerticalOverflow = pointSize / 2;

    patternWidth = pointSize + gapSize;
    surplusWidth = (width + gapSize) % patternWidth;

    xPosition = strokeVerticalOverflow + surplusWidth / 2;
    List<Offset> points = [];

    // position + pointSize <= width + pointSize
    do {
      points.add(Offset(xPosition, strokeVerticalOverflow));
    } while ((xPosition += patternWidth) <= width);

    canvas.drawPoints(PointMode.points, points, paint);
  }
}
