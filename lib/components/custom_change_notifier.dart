import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// copied ValueNotifier class, without set method
class CustomChangeNotifier<T> extends ChangeNotifier
    implements ValueListenable<T> {
  CustomChangeNotifier(this._value);

  @override
  T get value => _value;
  T _value;

  @override
  String toString() => '${describeIdentity(this)}($value)';

  void change(T value) {
    if (_value == value) return;

    _value = value;
    notifyListeners();
  }
}
