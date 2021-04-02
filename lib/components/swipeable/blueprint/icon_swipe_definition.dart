import 'package:chapp/components/swipeable/blueprint/swipe_definition.dart';
import 'package:flutter/material.dart';

class IconSwipeDefinition extends SwipeDefinition {
  final IconData iconData;
  final bool brightenEffect;

  IconSwipeDefinition({
    @required this.iconData,
    double swipeThreshold = 36.0,
    VoidCallback swipeCallback,
    this.brightenEffect = false,
  }) : super(
          swipeThreshold: swipeThreshold,
          swipeCallback: swipeCallback,
        );
}
