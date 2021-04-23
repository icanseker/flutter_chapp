import 'package:chapp/components/avatar/blueprint/avatar_shape.dart';
import 'package:flutter/material.dart';

class SquareShapedAvatar extends AvatarShape {
  SquareShapedAvatar({
    @required double size,
    double topLeftBorderRadius,
    double topRightBorderRadius,
    double bottomLeftBorderRadius,
    double bottomRightBorderRadius,
  }) : super(
          size: size,
          topLeftBorderRadius: topLeftBorderRadius,
          topRightBorderRadius: topRightBorderRadius,
          bottomLeftBorderRadius: bottomLeftBorderRadius,
          bottomRightBorderRadius: bottomRightBorderRadius,
        );
}
