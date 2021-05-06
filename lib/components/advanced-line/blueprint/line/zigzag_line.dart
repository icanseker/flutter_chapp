import 'dart:math';

import 'package:chapp/components/advanced-line/blueprint/line/line.dart';
import 'package:chapp/components/advanced-line/blueprint/line/solid_line.dart';
import 'package:flutter/material.dart';

class ZigzagLine extends Line {
  final double depth;
  final double angle;

  const ZigzagLine({this.depth = 8.0, this.angle = 90});

  @override
  void draw(
    Canvas canvas,
    double width,
    Paint paint,
  ) {
    double zgWidth = angle == 90.0 ? depth : (depth * tan(angle / 360 * pi));
    double zigZagAperture = zgWidth * 2;
    int zigZagCount = (width / zigZagAperture).floor();

    if (zigZagCount == 0) return SolidLine().draw(canvas, width, paint);

    // zigzag floor point = zigzag height
    // zigzag ceiling point = 0.0

    List<Offset> points = [];
    Path zigzagPath = new Path();
    double xPosition = 0.0;

    // divide surplus length into two equal parts
    // as starting and ending space
    xPosition = (width % zigZagAperture) / 2;
    double yMidPoint = depth / 2;

    points.add(Offset(xPosition, yMidPoint));
    points.add(Offset(xPosition += zgWidth / 2, 0.0));
    points.add(Offset(xPosition += zgWidth, depth));

    for (int i = 2; i <= zigZagCount; i++) {
      points.add(Offset(xPosition, depth));
      points.add(Offset(xPosition += zgWidth, 0.0));
      points.add(Offset(xPosition += zgWidth, depth));
    }

    points.add(Offset(xPosition, depth));
    points.add(Offset(xPosition += zgWidth / 2, yMidPoint));

    zigzagPath.addPolygon(points, false);
    canvas.drawPath(zigzagPath, paint);
  }
}
