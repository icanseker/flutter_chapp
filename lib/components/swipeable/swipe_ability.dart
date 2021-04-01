import 'package:chapp/components/swipeable/blueprint/swipe_definition.dart';
import 'package:flutter/material.dart';

class SwipeAbility extends StatefulWidget {
  final Widget child;
  final SwipeDefinition leftSwipe;
  final SwipeDefinition rightSwipe;

  const SwipeAbility({
    Key key,
    @required this.child,
    this.leftSwipe,
    this.rightSwipe,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SwipeAbilityState();
  }
}

class _SwipeAbilityState extends State<SwipeAbility>
    with TickerProviderStateMixin {
  AnimationController swipeAnimationController;
  Animation<Offset> swipeAnimation;
  double previousSwipeAmount = 0.0;
  double swipeAmount = 0.0;

  @override
  void initState() {
    super.initState();
    swipeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    swipeAnimation =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(1.0, 0.0))
            .animate(swipeAnimationController);
    swipeAnimationController.animateTo(0.0);
  }

  @override
  void dispose() {
    swipeAnimationController.dispose();
    super.dispose();
  }

  void onSwipeEnd() {
    swipeAnimationController.animateTo(0.0,
        duration: Duration(milliseconds: 100));
  }

  void onSwiping(DragUpdateDetails details) {
    swipeAmount += details.primaryDelta;

    if (previousSwipeAmount.sign != swipeAmount.sign) {
      setState(() {
        swipeAnimation = Tween<Offset>(
                begin: Offset(0.0, 0.0), end: Offset(swipeAmount.sign, 0.0))
            .animate(swipeAnimationController);
      });
    }

    swipeAnimationController.value = (swipeAmount / context.size.width).abs();

    if (swipeAmount.sign > 0)
      swipingToRight(swipeAmount);
    else
      swipingToLeft(swipeAmount);
  }

  void swipingToRight(double swipeAmount) {
    if (swipeAmount < previousSwipeAmount) {
      //print('swiping right canceled ' + swipeAmount.toString());
      previousSwipeAmount = swipeAmount;
    } else {
      if (swipeAmount >
          context.size.width * (widget.rightSwipe.swipeThreshold / 100)) {
        //print('Right swipe achieved');
      } else {
        previousSwipeAmount = swipeAmount;
      }
    }
  }

  void swipingToLeft(double swipeAmount) {
    if (swipeAmount > previousSwipeAmount) {
      //print('swiping left canceled ' + swipeAmount.toString());
      previousSwipeAmount = swipeAmount;
    } else {
      if (swipeAmount.abs() >
          context.size.width * (widget.leftSwipe.swipeThreshold / 100)) {
        //print('Left swipe achieved');
      } else {
        previousSwipeAmount = swipeAmount;
      }
    }
  }

  void onSwipeEnded(DragEndDetails endDetails) {
    swipeAnimationController.animateTo(
      0.0,
      duration: Duration(milliseconds: 50),
    );
    previousSwipeAmount = 0.0;
    swipeAmount = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: onSwiping,
      onHorizontalDragEnd: onSwipeEnded,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          SlideTransition(position: swipeAnimation, child: widget.child),
        ],
      ),
    );
  }
}
