import 'package:chapp/components/avatar/blueprint/avatar_shape.dart';
import 'package:flutter/material.dart';

class SquareShapedAvatar extends AvatarShape {
  final double topLeftBorderRadius;
  final double topRightBorderRadius;
  final double bottomLeftBorderRadius;
  final double bottomRightBorderRadius;

  SquareShapedAvatar({
    @required double size,
    this.topLeftBorderRadius = 0,
    this.topRightBorderRadius = 0,
    this.bottomLeftBorderRadius = 0,
    this.bottomRightBorderRadius = 0,
  }) : super(size: size);
}
