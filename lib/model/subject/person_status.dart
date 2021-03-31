import 'package:flutter/material.dart';

enum PersonStatus { online, offline, writing }

extension PersonStatusIde on PersonStatus {
  String get ide {
    switch (this) {
      case PersonStatus.online:
        return 'Online';
      case PersonStatus.offline:
        return 'Offline';
      case PersonStatus.writing:
        return 'Typing';
    }
    return '';
  }

  Color get ideColor {
    switch (this) {
      case PersonStatus.online:
        return Colors.green;
      case PersonStatus.offline:
        return Colors.red;
      case PersonStatus.writing:
        return Colors.black54;
    }
    return Colors.black;
  }
}
