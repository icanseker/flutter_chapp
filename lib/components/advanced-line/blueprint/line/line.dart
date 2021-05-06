import 'package:flutter/material.dart';

abstract class Line {
  const Line();

  void draw(
    Canvas canvas,
    double width,
    Paint paint,
  );
}
