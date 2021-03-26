import 'package:chapp/components/avatar/blueprint/avatar_badge.dart';
import 'package:chapp/components/avatar/blueprint/avatar_shape.dart';
import 'package:chapp/components/avatar/blueprint/circle_avatar.dart';
import 'package:chapp/components/avatar/blueprint/square_avatar.dart';
import 'package:chapp/components/empty_widget.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final AvatarShape avatarShape;
  final Image avatarImage;
  final Color backgroundColor;
  final Color borderColor;
  final double borderSize;
  final AvatarBadge avatarBadge;

  const AvatarWidget({
    Key key,
    @required this.avatarShape,
    @required this.avatarImage,
    this.backgroundColor = Colors.white,
    this.borderSize = 0,
    this.borderColor = Colors.black,
    this.avatarBadge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (avatarShape.runtimeType) {
      case SquareShapedAvatar:
        {
          double topLeftRadius =
              (avatarShape as SquareShapedAvatar).topLeftBorderRadius;
          double topRightRadius =
              (avatarShape as SquareShapedAvatar).topRightBorderRadius;
          double bottomLeftRadius =
              (avatarShape as SquareShapedAvatar).bottomLeftBorderRadius;
          double bottomRightRadius =
              (avatarShape as SquareShapedAvatar).bottomRightBorderRadius;

          double badgePaddingAmount;

          // for circle
          if (avatarBadge != null) {
            Alignment badgePosition = avatarBadge.position;
            if (badgePosition == Alignment.center)
              badgePaddingAmount = 0;
            else {
              if (badgePosition == Alignment.topRight)
                badgePaddingAmount = topRightRadius * 0.29;
              else if (badgePosition == Alignment.topLeft)
                badgePaddingAmount = topLeftRadius * 0.29;
              else if (badgePosition == Alignment.bottomRight)
                badgePaddingAmount = bottomRightRadius * 0.29;
              else if (badgePosition == Alignment.bottomLeft)
                badgePaddingAmount = bottomLeftRadius * 0.29;
              else if (badgePosition == Alignment.topCenter ||
                  badgePosition == Alignment.bottomCenter ||
                  badgePosition == Alignment.centerRight ||
                  badgePosition == Alignment.centerLeft) badgePaddingAmount = 0;

              badgePaddingAmount = badgePaddingAmount -
                  (avatarBadge.size / 2) +
                  (borderSize / 2) -
                  1;
            }
          }

          return Container(
            width: (avatarShape as SquareShapedAvatar).size,
            height: (avatarShape as SquareShapedAvatar).size,
            child: Stack(
              children: [
                Padding(
                  padding: this.avatarBadge == null
                      ? EdgeInsets.zero
                      : _getBadgeContainerPadding(badgePaddingAmount),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(topLeftRadius),
                        topRight: Radius.circular(topRightRadius),
                        bottomLeft: Radius.circular(bottomLeftRadius),
                        bottomRight: Radius.circular(bottomRightRadius),
                      ),
                      border: this.borderSize == 0
                          ? null
                          : Border.all(
                              color: this.borderColor,
                              width: this.borderSize,
                            ),
                      color: this.backgroundColor,
                      image: DecorationImage(
                        image: this.avatarImage.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                this.avatarBadge == null
                    ? EmptyWidget()
                    : Padding(
                        padding: _getBadgePadding(
                          badgePaddingAmount,
                          topLeftRadius,
                          topRightRadius,
                          bottomLeftRadius,
                          bottomRightRadius,
                        ),
                        child: Align(
                          alignment: this.avatarBadge.position,
                          child: Container(
                            height: this.avatarBadge.size,
                            width: this.avatarBadge.size,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: avatarBadge.color,
                              border: this.avatarBadge.borderSize == 0
                                  ? null
                                  : Border.all(
                                      color: this.avatarBadge.borderColor,
                                      width: this.avatarBadge.borderSize,
                                    ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
        }
      case CircleShapedAvatar:
        {
          return AvatarWidget(
            avatarShape: SquareShapedAvatar(
              size: avatarShape.size,
              topLeftBorderRadius: avatarShape.size / 2,
              topRightBorderRadius: avatarShape.size / 2,
              bottomLeftBorderRadius: avatarShape.size / 2,
              bottomRightBorderRadius: avatarShape.size / 2,
            ),
            avatarImage: this.avatarImage,
            backgroundColor: this.backgroundColor,
            borderSize: this.borderSize,
            borderColor: this.borderColor,
            avatarBadge: this.avatarBadge,
          );
        }
      default:
        return EmptyWidget();
    }
  }

  EdgeInsetsGeometry _getBadgePadding(
    double badgePaddingAmount,
    double topLeftRadius,
    double topRightRadius,
    double bottomLeftRadius,
    double bottomRightRadius,
  ) {
    Alignment badgePosition = this.avatarBadge.position;

    if (badgePaddingAmount <= 0) return EdgeInsets.zero;

    if (badgePosition == Alignment.topRight && topRightRadius > 0) {
      return EdgeInsets.only(
          top: badgePaddingAmount, right: badgePaddingAmount);
    }
    if (badgePosition == Alignment.topLeft && topLeftRadius > 0) {
      return EdgeInsets.only(top: badgePaddingAmount, left: badgePaddingAmount);
    }
    if (badgePosition == Alignment.bottomRight && bottomRightRadius > 0) {
      return EdgeInsets.only(
          bottom: badgePaddingAmount, right: badgePaddingAmount);
    }
    if (badgePosition == Alignment.bottomLeft && bottomLeftRadius > 0) {
      return EdgeInsets.only(
          bottom: badgePaddingAmount, left: badgePaddingAmount);
    }

    return EdgeInsets.zero;
  }

  EdgeInsetsGeometry _getBadgeContainerPadding(double badgePaddingAmount) {
    if (badgePaddingAmount > 0)
      return EdgeInsets.zero;
    else
      return EdgeInsets.all(-badgePaddingAmount);
  }
}
