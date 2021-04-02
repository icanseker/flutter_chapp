import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/swipeable/blueprint/icon_swipe_definition.dart';
import 'package:flutter/material.dart';

class IconSwipeAbility extends StatefulWidget {
  final Widget child;
  final double contextWidth;
  final IconSwipeDefinition leftSwipe;
  final IconSwipeDefinition rightSwipe;

  final BoxDecoration surfaceDecoration;
  final double surfaceHeight;

  const IconSwipeAbility({
    Key key,
    @required this.child,
    @required this.contextWidth,
    this.leftSwipe,
    this.rightSwipe,
    this.surfaceDecoration = const BoxDecoration(color: Colors.transparent),
    this.surfaceHeight,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IconSwipeAbilityState();
  }
}

class _IconSwipeAbilityState extends State<IconSwipeAbility>
    with TickerProviderStateMixin {
  AnimationController swipeAnimationController;
  Animation<Offset> swipeAnimation;

  double achievedSwipeDirection = 0.0;

  double swipeAmount = 0.0;
  double swipeAmountWidthRatio = 0.0;
  double previousSwipeAmountWidthRatio = 0.0;

  AnimationController swipeRightBrightenAnimationController;
  Animation<double> swipeRightBrightenAnimation;

  AnimationController swipeLeftBrightenAnimationController;
  Animation<double> swipeLeftBrightenAnimation;

  double swipeAmountCoeff = 1.0;

  @override
  void initState() {
    super.initState();

    if (widget.contextWidth < 400)
      this.swipeAmountCoeff *= 400 / widget.contextWidth;

    swipeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    swipeAnimation =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(1.0, 0.0))
            .animate(swipeAnimationController);
    swipeAnimationController.animateTo(0.0);

    if (widget.rightSwipe.brightenEffect) {
      swipeRightBrightenAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
      );
      swipeRightBrightenAnimation = Tween<double>(begin: 0.0, end: 1.0)
          .animate(swipeRightBrightenAnimationController);
      swipeRightBrightenAnimationController.animateTo(0.0);
    }

    if (widget.leftSwipe.brightenEffect) {
      swipeLeftBrightenAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
      );
      swipeLeftBrightenAnimation = Tween<double>(begin: 0.0, end: 1.0)
          .animate(swipeLeftBrightenAnimationController);
      swipeLeftBrightenAnimationController.animateTo(0.0);
    }
  }

  @override
  void dispose() {
    swipeAnimationController.dispose();
    super.dispose();
  }

  void onSwiping(DragUpdateDetails details) {
    this.achievedSwipeDirection = 0.0;

    swipeAmount += details.primaryDelta;
    this.swipeAmountWidthRatio = (swipeAmount / widget.contextWidth);

    if (previousSwipeAmountWidthRatio.sign != this.swipeAmountWidthRatio.sign) {
      setState(() {
        swipeAnimation = Tween<Offset>(
                begin: Offset(0.0, 0.0), end: Offset(swipeAmount.sign, 0.0))
            .animate(swipeAnimationController);
      });
    }

    swipeAnimationController.value = swipeAmountWidthRatio.abs();
    double normalizedSwipeAmountRatio =
        swipeAmountWidthRatio * this.swipeAmountCoeff;

    if (swipeAmount.sign > 0)
      swipingToRight(normalizedSwipeAmountRatio);
    else
      swipingToLeft(normalizedSwipeAmountRatio);

    previousSwipeAmountWidthRatio = swipeAmountWidthRatio;
  }

  void swipingToRight(double normalizedSwipeAmountRatio) {
    if (widget.rightSwipe.brightenEffect)
      setState(() {
        swipeRightBrightenAnimationController.value =
            normalizedSwipeAmountRatio / widget.rightSwipe.swipeThreshold;
      });

    if (normalizedSwipeAmountRatio > widget.rightSwipe.swipeThreshold) {
      this.achievedSwipeDirection = 1.0;
    } else
      this.achievedSwipeDirection = 0.0;

    // normalizedSwipeAmountRatio < previousSwipeAmountWidthRatio => swipe is canceled
  }

  void swipingToLeft(double normalizedSwipeAmountRatio) {
    if (widget.leftSwipe.brightenEffect)
      setState(() {
        swipeLeftBrightenAnimationController.value =
            normalizedSwipeAmountRatio.abs() / widget.leftSwipe.swipeThreshold;
      });

    if (normalizedSwipeAmountRatio.abs() > widget.leftSwipe.swipeThreshold) {
      this.achievedSwipeDirection = -1.0;
    } else
      this.achievedSwipeDirection = 0.0;

    // normalizedSwipeAmountRatio > previousSwipeAmountWidthRatio => swipe is canceled
  }

  void onSwipeEnded(DragEndDetails endDetails) {
    swipeAnimationController.animateTo(
      0.0,
      duration: Duration(milliseconds: 50),
    );

    if (this.swipeRightBrightenAnimationController != null) {
      setState(() {
        swipeRightBrightenAnimationController.value = 0.0;
      });
    }

    if (this.swipeLeftBrightenAnimationController != null) {
      setState(() {
        swipeLeftBrightenAnimationController.value = 0.0;
      });
    }

    swipeAmount = 0.0;
    swipeAmountWidthRatio = 0.0;
    previousSwipeAmountWidthRatio = 0.0;

    if (this.achievedSwipeDirection == 1.0) {
      print('right swipe triggered');
    }
    if (this.achievedSwipeDirection == -1.0) {
      print('left swipe triggered');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: onSwiping,
      onHorizontalDragEnd: onSwipeEnded,
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        height: widget.surfaceHeight,
        decoration: widget.surfaceDecoration,
        child: Stack(
          alignment: Alignment.center,
          children: [
            widget.rightSwipe != null
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Opacity(
                      opacity: widget.rightSwipe.brightenEffect
                          ? swipeRightBrightenAnimation.value
                          : 1.0,
                      child: Icon(widget.rightSwipe.iconData),
                    ),
                  )
                : EmptyWidget(),
            widget.leftSwipe != null
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Opacity(
                      opacity: widget.leftSwipe.brightenEffect
                          ? swipeLeftBrightenAnimation.value
                          : 1.0,
                      child: Icon(widget.leftSwipe.iconData),
                    ),
                  )
                : EmptyWidget(),
            SlideTransition(
              position: swipeAnimation,
              child: Container(
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
