import 'package:flutter/material.dart';

class AvatarBadge {
  final Alignment position;
  final Color color;
  final double size;
  final double borderSize;
  final Color borderColor;

  AvatarBadge({
    @required this.position,
    @required this.color,
    @required this.size,
    this.borderSize = 0,
    this.borderColor = Colors.black,
  });
}
