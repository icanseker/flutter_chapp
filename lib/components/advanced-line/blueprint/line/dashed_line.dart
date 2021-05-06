import 'dart:ui';

import 'package:chapp/components/advanced-line/blueprint/line/line.dart';
import 'package:flutter/material.dart';

class DashedLine extends Line {
  final double dashSize;
  final double gapSize;

  const DashedLine({this.dashSize = 10.0, this.gapSize = 10.0});

  @override
  void draw(
    Canvas canvas,
    double width,
    Paint paint,
  ) {
    List<Offset> points = [];
    double patternWidth, surplusWidth, firstDashSize;
    double xPosition = 0.0, strokeVerticalOverflow;

    strokeVerticalOverflow = paint.strokeWidth / 2;

    if (paint.strokeCap == StrokeCap.butt) {
      patternWidth = dashSize + gapSize;
      surplusWidth = (width + gapSize) % patternWidth;

      if (surplusWidth != 0) {
        if (gapSize > dashSize && gapSize - surplusWidth >= dashSize)
          xPosition = surplusWidth / 2;
        else
          firstDashSize = (dashSize - gapSize + surplusWidth) / 2;
      }

      if (firstDashSize != null) {
        points.add(Offset(xPosition, strokeVerticalOverflow));
        points.add(Offset(xPosition += firstDashSize, strokeVerticalOverflow));
        xPosition += gapSize;
      }

      do {
        points.add(Offset(xPosition, strokeVerticalOverflow));
        points.add(Offset(xPosition + dashSize, strokeVerticalOverflow));
      } while ((xPosition += patternWidth) + dashSize <= width);

      if (firstDashSize != null) {
        points.add(Offset(width - firstDashSize, strokeVerticalOverflow));
        points.add(Offset(width, strokeVerticalOverflow));
      }
    } else {
      double correctedDashSize = dashSize + paint.strokeWidth;

      patternWidth = correctedDashSize + gapSize;
      surplusWidth = (width + gapSize) % patternWidth;

      xPosition = surplusWidth / 2;

      // position + pointSize <= width + pointSize
      do {
        points.add(Offset(xPosition, strokeVerticalOverflow));
        points
            .add(Offset(xPosition + correctedDashSize, strokeVerticalOverflow));
      } while ((xPosition += patternWidth) + correctedDashSize <= width);

      if (surplusWidth < paint.strokeWidth) {
        points.first = Offset(
          points.first.dx + strokeVerticalOverflow,
          points.first.dy,
        );
        points.last = Offset(
          points.last.dx - strokeVerticalOverflow,
          points.last.dy,
        );
      }
    }

    canvas.drawPoints(PointMode.lines, points, paint);
  }
}
