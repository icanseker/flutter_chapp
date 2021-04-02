import 'package:flutter/material.dart';

abstract class SwipeDefinition {
  double swipeThreshold;
  final VoidCallback swipeCallback;

  SwipeDefinition({
    this.swipeCallback,
    this.swipeThreshold = 36.0,
  }) {
    this.swipeThreshold /= 100.0;
  }
}
