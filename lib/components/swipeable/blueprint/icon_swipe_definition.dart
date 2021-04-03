import 'package:chapp/components/swipeable/blueprint/swipe_definition.dart';
import 'package:flutter/material.dart';

class IconSwipeDefinition extends SwipeDefinition {
  final IconData iconData;
  final String iconDefinition;
  final bool brightenEffect;

  IconSwipeDefinition({
    @required this.iconData,
    this.iconDefinition,
    double swipeThreshold = 25.0,
    VoidCallback swipeCallback,
    this.brightenEffect = false,
  }) : super(
          swipeThreshold: swipeThreshold,
          swipeCallback: swipeCallback,
        );
}
