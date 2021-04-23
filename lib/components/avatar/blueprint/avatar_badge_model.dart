import 'package:chapp/components/custom_change_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AvatarBadgeModel {
  CustomChangeNotifier<Color> _colorHolding;
  CustomChangeNotifier<double> _sizeHolding;
  CustomChangeNotifier<double> _borderSizeHolding;
  CustomChangeNotifier<Color> _borderColorHolding;

  _AvatarBadgeChangeNotifier _changeNotifier;

  AvatarBadgeModel({
    @required Alignment position,
    @required Color color,
    @required double size,
    double borderSize,
    Color borderColor,
  }) {
    _colorHolding = CustomChangeNotifier(color);
    _sizeHolding = CustomChangeNotifier(size);
    _borderSizeHolding = CustomChangeNotifier(borderSize);
    _borderColorHolding = CustomChangeNotifier(borderColor);

    _changeNotifier = _AvatarBadgeChangeNotifier(this);
  }

  CustomChangeNotifier<Color> get colorChangeNotifier => _colorHolding;

  CustomChangeNotifier<double> get sizeChangeNotifier => _sizeHolding;

  CustomChangeNotifier<double> get borderSizeChangeNotifier =>
      _borderSizeHolding;

  CustomChangeNotifier<Color> get borderColorChangeNotifier =>
      _borderColorHolding;

  Color get color => colorChangeNotifier.value;

  double get size => sizeChangeNotifier.value;

  double get borderSize => borderSizeChangeNotifier.value;

  Color get borderColor => borderColorChangeNotifier.value;

  _AvatarBadgeChangeNotifier get change => _changeNotifier;

  _AvatarBadgeChangeNotifier get changeNotifier => _changeNotifier;
}

class _AvatarBadgeChangeNotifier
    extends CustomChangeNotifier<AvatarBadgeModel> {
  _AvatarBadgeChangeNotifier(AvatarBadgeModel badgeModel) : super(badgeModel) {
    value.colorChangeNotifier.addListener(notifyListeners);
    value.sizeChangeNotifier.addListener(notifyListeners);
    value.borderSizeChangeNotifier.addListener(notifyListeners);
    value.borderColorChangeNotifier.addListener(notifyListeners);
  }

  void color(Color color) => value._colorHolding.change(color);

  void size(double size) => value._sizeHolding.change(size);

  void borderSize(double borderSize) =>
      value._borderSizeHolding.change(borderSize);

  void borderColor(Color borderColor) =>
      value._borderColorHolding.change(borderColor);
}
