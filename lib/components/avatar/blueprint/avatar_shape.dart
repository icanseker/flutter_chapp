import 'package:chapp/components/custom_change_notifier.dart';
import 'package:flutter/material.dart';

abstract class AvatarShape {
  CustomChangeNotifier<double> _size;

  double _topLeftBorderRadius;
  double _topRightBorderRadius;
  double _bottomLeftBorderRadius;
  double _bottomRightBorderRadius;

  _AvatarShapeChangeNotifier _changeNotifier;

  AvatarShape({
    @required double size,
    double topLeftBorderRadius,
    double topRightBorderRadius,
    double bottomLeftBorderRadius,
    double bottomRightBorderRadius,
  }) {
    _size = CustomChangeNotifier(size);
    _topLeftBorderRadius = _validBorderRadius(topLeftBorderRadius);
    _topRightBorderRadius = _validBorderRadius(topRightBorderRadius);
    _bottomLeftBorderRadius = _validBorderRadius(bottomLeftBorderRadius);
    _bottomRightBorderRadius = _validBorderRadius(bottomRightBorderRadius);

    _changeNotifier = _AvatarShapeChangeNotifier(this);
  }

  static double _validBorderRadius(double borderRadius) {
    if (borderRadius == null || borderRadius < 0)
      return 0;
    else
      return borderRadius;
  }

  CustomChangeNotifier<double> get sizeChangeNotifier => _size;

  double get size => sizeChangeNotifier.value;

  double get topLeftBorderRadius => _topLeftBorderRadius;

  double get topRightBorderRadius => _topRightBorderRadius;

  double get bottomLeftBorderRadius => _bottomLeftBorderRadius;

  double get bottomRightBorderRadius => _bottomRightBorderRadius;

  _AvatarShapeChangeNotifier get change => _changeNotifier;

  _AvatarShapeChangeNotifier get changeNotifier => _changeNotifier;
}

class _AvatarShapeChangeNotifier extends CustomChangeNotifier<AvatarShape> {
  _AvatarShapeChangeNotifier(AvatarShape avatarShape) : super(avatarShape) {
    value.sizeChangeNotifier.addListener(notifyListeners);
  }

  void size(double size) {
    double rate = (size / value.size);

    value._topLeftBorderRadius *= rate;
    value._topRightBorderRadius *= rate;
    value._bottomLeftBorderRadius *= rate;
    value._bottomRightBorderRadius *= rate;

    value.sizeChangeNotifier.change(size);
  }
}
