import 'package:chapp/components/advanced-line/blueprint/line/line.dart';
import 'package:flutter/material.dart';

class OvaledLine extends Line {
  final double xSize;
  final double ySize;
  final double gapSize;

  const OvaledLine({
    this.xSize = 5.0,
    this.ySize = 10.0,
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
    double xPosition = 0.0, strokeVerticalOverflow, strokeHorizontalOverflow;

    double pointWidth = this.xSize +
        (paint.style == PaintingStyle.stroke ? paint.strokeWidth : 0.0);
    strokeHorizontalOverflow = pointWidth / 2;
    strokeVerticalOverflow = ySize / 2 +
        (paint.style == PaintingStyle.stroke ? paint.strokeWidth / 2 : 0.0);

    patternWidth = pointWidth + gapSize;
    surplusWidth = (width + gapSize) % patternWidth;

    xPosition = strokeHorizontalOverflow + surplusWidth / 2;

    // position + pointSize <= width + pointSize
    do {
      points.add(Offset(
        xPosition,
        strokeVerticalOverflow,
      ));
    } while ((xPosition += patternWidth) <= width);

    points.forEach((point) {
      canvas.drawOval(
          Rect.fromCenter(center: point, width: this.xSize, height: this.ySize),
          paint);
    });
  }
}
