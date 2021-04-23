import 'package:chapp/components/avatar/blueprint/avatar_badge_model.dart';
import 'package:chapp/components/avatar/blueprint/avatar_shape.dart';
import 'package:chapp/components/custom_change_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AvatarModel {
  AvatarShape _shape;
  CustomChangeNotifier<Image> _imageHolding;
  CustomChangeNotifier<Color> _backgroundColorHolding;
  CustomChangeNotifier<Color> _borderColorHolding;
  CustomChangeNotifier<double> _borderSizeHolding;

  AvatarBadgeModel _badgeModel;
  CustomChangeNotifier<Alignment> _badgePositionHolding;

  _AvatarChangeNotifier _changeNotifier;

  double _badgePaddingAmount;
  EdgeInsets _badgePaddingInsets;
  EdgeInsets _badgeContainerPaddingInsets;

  AvatarModel({
    @required AvatarShape shape,
    @required Image image,
    Color backgroundColor,
    double borderSize,
    Color borderColor,
    AvatarBadgeModel badgeModel,
    Alignment badgePosition,
  }) {
    _shape = shape;
    _imageHolding = CustomChangeNotifier(image);
    _backgroundColorHolding = CustomChangeNotifier(backgroundColor);
    _borderSizeHolding = CustomChangeNotifier(borderSize);
    _borderColorHolding = CustomChangeNotifier(borderColor);

    _badgeModel = badgeModel;
    _badgePositionHolding = CustomChangeNotifier(badgePosition);

    _calculateBadgePaddingAmount();

    _changeNotifier = _AvatarChangeNotifier(this);
  }

  AvatarShape get shape => _shape;

  CustomChangeNotifier<Image> get imageChangeNotifier => _imageHolding;

  CustomChangeNotifier<Color> get bgColorChangeNotifier =>
      _backgroundColorHolding;

  CustomChangeNotifier<double> get borderSizeChangeNotifier =>
      _borderSizeHolding;

  CustomChangeNotifier<Color> get borderColorChangeNotifier =>
      _borderColorHolding;

  Image get image => _imageHolding.value;

  Color get bgColor => _backgroundColorHolding.value;

  double get borderSize => _borderSizeHolding.value;

  Color get borderColor => _borderColorHolding.value;

  AvatarBadgeModel get badgeModel => _badgeModel;

  CustomChangeNotifier<Alignment> get badgePositionChangeNotifier =>
      _badgePositionHolding;

  Alignment get badgePosition => _badgePositionHolding.value;

  EdgeInsets get badgePaddingInsets => _badgePaddingInsets;

  EdgeInsets get badgeContainerPaddingInsets => _badgeContainerPaddingInsets;

  _AvatarChangeNotifier get change => _changeNotifier;

  _AvatarChangeNotifier get changeNotifier => _changeNotifier;

  void _calculateBadgePaddingAmount() {
    _badgePaddingAmount = 0;

    if (badgeModel != null) {
      if (badgePosition == Alignment.topRight)
        _badgePaddingAmount = shape.topRightBorderRadius * 0.29;
      else if (badgePosition == Alignment.topLeft)
        _badgePaddingAmount = shape.topLeftBorderRadius * 0.29;
      else if (badgePosition == Alignment.bottomRight)
        _badgePaddingAmount = shape.bottomRightBorderRadius * 0.29;
      else if (badgePosition == Alignment.bottomLeft)
        _badgePaddingAmount = shape.bottomLeftBorderRadius * 0.29;

      _badgePaddingAmount =
          _badgePaddingAmount - (badgeModel.size / 2) + (borderSize / 2) - 1;

      _calculateBadgePadding();
      _calculateBadgeContainerPadding();
    } else {
      _badgePaddingInsets = EdgeInsets.zero;
      _badgeContainerPaddingInsets = EdgeInsets.zero;
    }
  }

  void _calculateBadgePadding() {
    _badgePaddingInsets = EdgeInsets.zero;

    if (_badgePaddingAmount > 0) {
      if (badgePosition == Alignment.topRight &&
          shape.topRightBorderRadius > 0) {
        _badgePaddingInsets = EdgeInsets.only(
            top: _badgePaddingAmount, right: _badgePaddingAmount);
      }
      if (badgePosition == Alignment.topLeft && shape.topLeftBorderRadius > 0) {
        _badgePaddingInsets = EdgeInsets.only(
            top: _badgePaddingAmount, left: _badgePaddingAmount);
      }
      if (badgePosition == Alignment.bottomRight &&
          shape.bottomRightBorderRadius > 0) {
        _badgePaddingInsets = EdgeInsets.only(
            bottom: _badgePaddingAmount, right: _badgePaddingAmount);
      }
      if (badgePosition == Alignment.bottomLeft &&
          shape.bottomLeftBorderRadius > 0) {
        _badgePaddingInsets = EdgeInsets.only(
            bottom: _badgePaddingAmount, left: _badgePaddingAmount);
      }
    }
  }

  void _calculateBadgeContainerPadding() {
    _badgeContainerPaddingInsets = EdgeInsets.zero;

    if (_badgePaddingAmount < 0) {
      _badgeContainerPaddingInsets = EdgeInsets.all(_badgePaddingAmount * -1);
    }
  }
}

class _AvatarChangeNotifier extends CustomChangeNotifier<AvatarModel> {
  _AvatarChangeNotifier(AvatarModel avatarModel) : super(avatarModel) {
    value.shape.sizeChangeNotifier.addListener(notifyListeners);
    value.imageChangeNotifier.addListener(notifyListeners);
    value.bgColorChangeNotifier.addListener(notifyListeners);
    value.borderSizeChangeNotifier.addListener(notifyListeners);
    value.borderColorChangeNotifier.addListener(notifyListeners);

    if (value.badgeModel != null) {
      value.badgePositionChangeNotifier.addListener(notifyListeners);
      value.badgeModel.sizeChangeNotifier.addListener(notifyListeners);

      value.shape.sizeChangeNotifier
          .addListener(value._calculateBadgePaddingAmount);
      value.badgePositionChangeNotifier
          .addListener(value._calculateBadgePaddingAmount);
      value.borderSizeChangeNotifier
          .addListener(value._calculateBadgePaddingAmount);
      value.badgeModel.sizeChangeNotifier
          .addListener(value._calculateBadgePaddingAmount);
    }
  }

  void image(Image image) => value._imageHolding.change(image);

  void bgColor(Color bgColor) => value._backgroundColorHolding.change(bgColor);

  void borderSize(double borderSize) =>
      value._borderSizeHolding.change(borderSize);

  void borderColor(Color borderColor) =>
      value._borderColorHolding.change(borderColor);

  void badgePosition(Alignment badgePosition) =>
      value._badgePositionHolding.change(badgePosition);
}
