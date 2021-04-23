import 'package:chapp/components/avatar/blueprint/avatar_shape.dart';
import 'package:flutter/material.dart';

class CircleShapedAvatar extends AvatarShape {
  CircleShapedAvatar({
    @required double size,
  }) : super(
          size: size,
          topLeftBorderRadius: size / 2,
          topRightBorderRadius: size / 2,
          bottomLeftBorderRadius: size / 2,
          bottomRightBorderRadius: size / 2,
        );
}
