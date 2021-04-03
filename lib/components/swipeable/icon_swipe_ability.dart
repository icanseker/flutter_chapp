import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/components/swipeable/blueprint/icon_swipe_definition.dart';
import 'package:chapp/components/swipeable/blueprint/simultaneity_definition.dart';
import 'package:flutter/material.dart';

class IconSwipeAbility extends StatefulWidget {
  final Widget child;
  final double contextWidth;
  final SwipeSimultaneityController simultaneityController;

  final IconSwipeDefinition leftSwipe;
  final IconSwipeDefinition rightSwipe;

  final BoxDecoration surfaceDecoration;
  final double surfaceHeight;

  const IconSwipeAbility({
    Key key,
    @required this.child,
    @required this.contextWidth,
    @required this.simultaneityController,
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
  bool swipeAllowed;

  AnimationController swipeAnimationController;
  Animation<Offset> swipeAnimation;

  double achievedSwipeDirection = 0.0;

  double swipeAmount = 0.0;
  double swipeAmountWidthRatio = 0.0;
  double previousSwipeAmountWidthRatio = 0.0;

  double rightSwipeOpacity;
  double leftSwipeOpacity;

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

    this.rightSwipeOpacity = widget.rightSwipe.brightenEffect ? 0.0 : 1.0;
    this.leftSwipeOpacity = widget.leftSwipe.brightenEffect ? 0.0 : 1.0;
  }

  @override
  void dispose() {
    swipeAnimationController.dispose();
    super.dispose();
  }

  void onSwiping(DragUpdateDetails details) {
    if (this.swipeAllowed) {
      this.achievedSwipeDirection = 0.0;

      swipeAmount += details.primaryDelta;
      this.swipeAmountWidthRatio = (swipeAmount / widget.contextWidth);

      if (previousSwipeAmountWidthRatio.sign !=
          this.swipeAmountWidthRatio.sign) {
        setState(() {
          swipeAnimation = Tween<Offset>(
                  begin: Offset(0.0, 0.0), end: Offset(swipeAmount.sign, 0.0))
              .animate(swipeAnimationController);
        });
      }

      swipeAnimationController.value = swipeAmountWidthRatio.abs() < 0.50
          ? swipeAmountWidthRatio.abs()
          : 0.50;
      double normalizedSwipeAmountRatio =
          swipeAmountWidthRatio * this.swipeAmountCoeff;

      if (swipeAmount.sign > 0)
        swipingToRight(normalizedSwipeAmountRatio);
      else
        swipingToLeft(normalizedSwipeAmountRatio);

      previousSwipeAmountWidthRatio = swipeAmountWidthRatio;
    }
  }

  void swipingToRight(double normalizedSwipeAmountRatio) {
    if (widget.rightSwipe.brightenEffect)
      setState(() {
        this.rightSwipeOpacity =
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
        this.leftSwipeOpacity =
            normalizedSwipeAmountRatio.abs() / widget.leftSwipe.swipeThreshold;
      });

    if (normalizedSwipeAmountRatio.abs() > widget.leftSwipe.swipeThreshold) {
      this.achievedSwipeDirection = -1.0;
    } else
      this.achievedSwipeDirection = 0.0;

    // normalizedSwipeAmountRatio > previousSwipeAmountWidthRatio => swipe is canceled
  }

  void onSwipeEnded(DragEndDetails endDetails) {
    if (this.swipeAllowed) {
      widget.simultaneityController.swipeFinished();

      swipeAnimationController.animateTo(
        0.0,
        duration: Duration(milliseconds: 50),
      );

      swipeAmount = 0.0;
      swipeAmountWidthRatio = 0.0;
      previousSwipeAmountWidthRatio = 0.0;

      if (widget.rightSwipe.brightenEffect || widget.leftSwipe.brightenEffect)
        setState(() {
          if (widget.rightSwipe.brightenEffect) this.rightSwipeOpacity = 0.0;
          if (widget.leftSwipe.brightenEffect) this.leftSwipeOpacity = 0.0;
        });

      if (this.achievedSwipeDirection == 1.0) {
        print('right swipe triggered');
      }
      if (this.achievedSwipeDirection == -1.0) {
        print('left swipe triggered');
      }
    }

    this.swipeAllowed = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (_) {
        this.swipeAllowed = widget.simultaneityController.isSwipeAllowed;
      },
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
                      opacity:
                          rightSwipeOpacity <= 1.0 ? rightSwipeOpacity : 1.0,
                      child: Container(
                        width: widget.contextWidth / 2 - 6,
                        child: Row(
                          children: [
                            Icon(widget.rightSwipe.iconData),
                            widget.rightSwipe.iconDefinition != null
                                ? SizedBox(width: 4)
                                : EmptyWidget(),
                            widget.rightSwipe.iconDefinition != null
                                ? Expanded(
                                    child: Opacity(
                                      opacity:
                                          rightSwipeOpacity >= 1.0 ? 1.0 : 0.0,
                                      child: Text(
                                        widget.rightSwipe.iconDefinition,
                                        style: TextStyle(color: Colors.black54),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                : EmptyWidget(),
                          ],
                        ),
                      ),
                    ),
                  )
                : EmptyWidget(),
            SizedBox(width: 12),
            widget.leftSwipe != null
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Opacity(
                      opacity: leftSwipeOpacity <= 1.0 ? leftSwipeOpacity : 1.0,
                      child: Container(
                        width: widget.contextWidth / 2 - 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            widget.leftSwipe.iconDefinition != null
                                ? Expanded(
                                    child: Opacity(
                                      opacity: this.leftSwipeOpacity >= 1.0
                                          ? 1.0
                                          : 0.0,
                                      child: Text(
                                        widget.leftSwipe.iconDefinition,
                                        style: TextStyle(color: Colors.black54),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  )
                                : EmptyWidget(),
                            widget.leftSwipe.iconDefinition != null
                                ? SizedBox(width: 4)
                                : EmptyWidget(),
                            Icon(widget.leftSwipe.iconData),
                          ],
                        ),
                      ),
                    ),
                  )
                : EmptyWidget(),
            SlideTransition(
              position: swipeAnimation,
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
