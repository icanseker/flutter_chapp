import 'package:chapp/components/avatar/blueprint/avatar_shape.dart';
import 'package:flutter/material.dart';

class CircleShapedAvatar extends AvatarShape {
  CircleShapedAvatar({
    @required double radius,
  }) : super(size: radius * 2);
}
