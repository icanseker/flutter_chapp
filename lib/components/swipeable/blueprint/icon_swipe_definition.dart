import 'package:chapp/components/swipeable/blueprint/swipe_definition.dart';
import 'package:flutter/material.dart';

class IconSwipeDefinition extends SwipeDefinition {
  final IconData iconData;
  final String iconLabel;
  final bool brightenEffect;

  IconSwipeDefinition({
    @required this.iconData,
    this.iconLabel,
    double swipeThreshold = 25.0,
    VoidCallback swipeCallback,
    this.brightenEffect = false,
  }) : super(
          swipeThreshold: swipeThreshold,
          swipeCallback: swipeCallback,
        );
}
