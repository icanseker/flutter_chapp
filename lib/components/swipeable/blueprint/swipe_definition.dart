import 'package:flutter/material.dart';

class SwipeDefinition {
  final Widget background;
  final double swipeThreshold;

  final VoidCallback swipeCallback;

  SwipeDefinition({
    @required this.background,
    this.swipeCallback,
    this.swipeThreshold = 24.0,
  });
}
